#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "procinfo.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int sys_waitinfo(void) {
  struct procinfo *pinfo;

  if (argptr(0, (void*)&pinfo, sizeof(*pinfo)) < 0)
      return -1;

  return waitinfo(pinfo);
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  //if(growproc(n) < 0)
   // return -1;
  myproc()->sz += n;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int sys_ticks_run(void)
{
  int pid;

  if (argint(0, &pid) < 0)
    //return ticks_run(myproc()->pid);
    return -1;
  return ticks_run(pid);
}

int
sys_num_tickets(void)
{
  int pid;
  
  if(argint(0, &pid) < 0)
    return -1;
    
  return num_tickets(pid);
}

int
sys_set_tickets(void)
{
    int tickets;

    if (argint(0, &tickets) < 0)
      return -1;

    return set_tickets(tickets);
}

int
sys_get_tickets(void)
{
  int pid;
  
  if (argint(0, &pid) < 0)
    return -1;

  return get_tickets(pid);
}