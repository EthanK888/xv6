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