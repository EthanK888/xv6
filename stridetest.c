#include "types.h"
#include "stat.h"
#include "user.h"

#define LOOPS 10000

int
main(void)
{
  int pid;
  pid = getpid();

  pid = fork();
  if(pid < 0) {
    printf(1, "fork failed\n");
  } else if(pid == 0) {
    //child process
    pid = fork();

    if(pid < 0) {
      printf(1, "fork failed\n");
    } else if(pid == 0) {
       char *arr[5]={};
       exec("ls",arr);
      exit();
    }
    else{
      char *arr[5]={};
      exec("ls",arr);
      exit();
    }
  } else {
    char *arr[5]={};
    exec("ls",arr);
    exit();
  }
  
  exit();
}

/* int
main(void)
{
  int parent_pid = getpid();
  int child_pid1, child_pid2;
  
  printf(1, "Parent process (PID %d) has %d tickets\n", 
         parent_pid, num_tickets(parent_pid));
  
  //fork first child
  child_pid1 = fork();
  if(child_pid1 == 0) {
    
    int pid = getpid();
    int tickets = num_tickets(pid);
    printf(1, "Child 1 (PID %d) has %d tickets\n", pid, tickets);
    
    for(int i = 0; i < 100000; i++) {
      if(i % 100000 == 0) {
        //printf(1, "Child 1 (PID %d) still working (%d ticks)...\n", 
             //  pid, ticks_run(pid));
             char *arr[5]={};
             exec("stressfs",arr);

      }
    }
    
    //printf(1, "Child 1 (PID %d) finished with %d ticks\n", 
      //     pid, ticks_run(pid));
    exit();
  }
  
  //fork second child
  child_pid2 = fork();
  if(child_pid2 == 0) {
    
    int pid = getpid();
    int tickets = num_tickets(pid);
    printf(1, "Child 2 (PID %d) has %d tickets\n", pid, tickets);
    
    
    for(int i = 0; i < 100000; i++) {
      if(i % 100000 == 0) {
       // printf(1, "Child 2 (PID %d) still working (%d ticks)...\n", 
               //pid, ticks_run(pid));
      }
    }
    
    printf(1, "Child 2 (PID %d) finished with %d ticks\n", 
           pid, ticks_run(pid));
    exit();
  }
  
  //wait
  wait();
  wait();
  
  printf(1, "Test complete.\n");
  exit();
} */