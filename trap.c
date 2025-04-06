#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "traps.h"
#include "spinlock.h"

// Interrupt descriptor table (shared by all CPUs).
struct gatedesc idt[256];
extern uint vectors[];  // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  lidt(idt, sizeof(idt));
}

// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}

// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }

    //if (myproc() && myproc()->state == RUNNING) {
    //  myproc()->numticks++;  
  //}
    
    lapiceoi();
    break;
    
  //Project 3: check for page faults
  case T_PGFLT:{
    //Track the number of page faults each program has
    myproc()->pagefaults++;
    uint a = rcr2();
    cprintf("\nPAGE FAULT %d FOR PROCESS %d\n", myproc()->pagefaults, myproc()->pid);
    cprintf("memory address causing the page fault: 0x%x\n", a);
    
    //Round the faulting address down to a page boundary
    a = PGROUNDDOWN(a);
    cprintf("START OF PAGE FOR THIS MEMORY ACCESS: 0x%x\n", a);
  
    //Lazy allocator
    #ifdef LAZY
      //Allocate a frame for the process
      char * mem = kalloc();
      if(mem == 0){
        cprintf("out of memory\n");
      } else {
        memset(mem, 0, PGSIZE);
        //Map the frame to the page table for the process
        if (mappages(myproc()->pgdir, (char *)a, PGSIZE, V2P(mem), PTE_W | PTE_U) > -1)
        {
          cprintf("page table entry added to cover all virtual addresses from 0x%x to 0x%x\n", a, a+PGSIZE-1);
          break;
        }
        cprintf("error mapping pages\n");
        kfree(mem);
      }

    //Locality based allocator
    #elif defined(LOCALITY)
      int error = 0;
      //Track which pages have been allocated in case of an error
      uint allocatedPages[5] = {0};
      int numPagesAllocated = 0;

      //Allocate 5 pages - the one containing the faulting address and the next 4
      for(int i = 0; i < 5; i++, a += PGSIZE){ 
        char * mem = kalloc();
        if(mem == 0){
          cprintf("out of memory\n");
          error = 1;
          break;
        } else {
          memset(mem, 0, PGSIZE);
          if (mappages(myproc()->pgdir, (char *)a, PGSIZE, V2P(mem), PTE_W | PTE_U) < 0)
          {
            cprintf("error mapping pages\n");
            kfree(mem);
            error = 1;
            break;
          } else {
            allocatedPages[numPagesAllocated] = a;
            numPagesAllocated++;
            cprintf("page table entry added to cover all virtual addresses from 0x%x to 0x%x\n", a, a+PGSIZE-1);
          }
        }
      }

      if(error){
        //If there's any error, deallocate each page given to the process before the error and kill the process
        for(int i = 0; numPagesAllocated; i++){
          deallocuvm(myproc()->pgdir, allocatedPages[i] + PGSIZE, allocatedPages[i]);
        }
      }
      else break;
    #endif
  }
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
     tf->trapno == T_IRQ0+IRQ_TIMER) {
      myproc()->numticks++; //increase tick number
      #ifdef STRIDE  
        // Increment pass value by stride
        myproc()->passValue += myproc()->stride;
      #endif
      yield();
    }

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
