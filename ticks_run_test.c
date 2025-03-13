#include "types.h"
#include "stat.h"
#include "user.h"

#define LOOPS 2000000000

int
main(void)
{
  int pid;
  int no_ticks;
  pid = getpid();
  printf(1, "current process- PID %d ticks: %d\n", pid, ticks_run(pid));
  
  //process does not exist
  no_ticks = ticks_run(9999);
  printf(1, "non existent process ticks: %d\n", no_ticks);

  //Prevent the compiler from removing the loop with volatile
  volatile int test = 0;
  for(int i = 0; i < LOOPS; i++){
    test++;
  }
  
  printf(1, "ticks after many loops: %d\n", ticks_run(pid));
  
  exit();
}

