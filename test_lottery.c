#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void)
{
  int pid = getpid();
  
  int tickets = get_tickets(pid);
  printf(1, "initial tickets for process %d: %d\n", pid, tickets);
  
  int new_tickets = 25;
  printf(1, "set tickets to %d\n", new_tickets);
  int result = set_tickets(new_tickets);
  
  if(result == 0) {
    printf(1, "Set tickets successful\n");
  } else {
    printf(1, "Set tickets failed  %d\n", result);
  }
  
  tickets = get_tickets(pid);
  printf(1, "New ticket count: %d\n", tickets);
  
  //set_tickets with invalid value
  result = set_tickets(-5);
  printf(1, "set_tickets(-5) returned: %d\n", result);
  
  //child process and check its tickets
  int child_pid = fork();
  if(child_pid == 0) {
    pid = getpid();
    tickets = get_tickets(pid);
    printf(1, "child process %d initial tickets: %d\n", pid, tickets);
    
    set_tickets(50);
    tickets = get_tickets(pid);
    printf(1, "Child process %d new tickets: %d\n", pid, tickets);
    exit();
  } else {
    //parent process
    printf(1, "Parent checking child (PID %d) tickets: %d\n", child_pid, get_tickets(child_pid));
    wait();
  }
  
  printf(1, "complete\n");
  exit();
}

/*
//CPU-intensive work
void cpu_bound_workload() {
  int i;
  volatile int counter = 0;
  for (i = 0; i < 100000000; i++) {
      counter += i;
  }
  exit();
}

void advanced_scheduler_test() {
  int pid;
  int tickets;
  int i; 

  pid = fork();
  if (pid == 0) {
      // Child process 1 set tickets to 10
      set_tickets(10);
      cpu_bound_workload();  
  } else {
      // Fork process 2
      pid = fork();
      if (pid == 0) {
          // Child process 2 set tickets to 50
          set_tickets(50);
          cpu_bound_workload(); 
      } else {
          // Fork process 3
          pid = fork();
          if (pid == 0) {
              // Child process 3 set tickets to 90
              set_tickets(90);
              cpu_bound_workload();  
          } else {
              // Parent process check tickets and wait for children
              int child_pids[3] = {pid - 2, pid - 1, pid};

              // Get and print the tickets for each process
              for (i = 0; i < 3; i++) {  // Loop variable declared outside
                  tickets = get_tickets(child_pids[i]);
                  printf(1, "Process %d has %d tickets\n", child_pids[i], tickets);
              }

              // Wait for all child processes to finish
              for (i = 0; i < 3; i++) {  // Loop variable declared outside
                  wait();
              }

              printf(1, "Lottery scheduler test finished\n");
          }
      }
  }
}

int main(void) {
  printf(1, "Starting advanced scheduler test\n");
  advanced_scheduler_test();
  exit();
}
  */