#include "types.h"
#include "stat.h"
#include "user.h"

#define LOOPS 10

/*int main(void) {
    int pid = getpid();  //get current process ID
    printf(1, "PID: %d\n", pid);

    int before_ticks = ticks_run(pid);  //before sleeping
    printf(1, "before sleep ticks: %d\n", before_ticks);

    sleep(5);

    int after_ticks = ticks_run(pid); //after sleeping
    printf(1, "after sleep ticks: %d\n", after_ticks);

    //difference
    int ticks_used = after_ticks - before_ticks;
    printf(1, "ticks running: %d\n", ticks_used);

    exit();
}
*/
int
main(void)
{
  int pid, no_ticks;
  pid = getpid();
  printf(1, "current process- PID %d ticks: %d\n", pid, ticks_run(pid));
  
  for(int i = 0; i < 100000; i++) {
    ;
  }
  
  printf(1, "after computation ticks: %d\n", ticks_run(pid));
  
  //process does not exist
  no_ticks = ticks_run(9999);
  printf(1, "non existent process ticks: %d\n", no_ticks);
  
  pid = fork();
  if(pid < 0) {
    printf(1, "fork failed\n");
  } else if(pid == 0) {
    //child process
    pid = fork();

    if(pid < 0) {
      printf(1, "fork failed\n");
    } else if(pid == 0) {
      //grandchild process
      for(int i = 0; i < LOOPS; i++){
        printf(1, "grandchild process - PID %d ticks: %d\n", getpid(), ticks_run(getpid()));
      }
      exit();
    }
    else{
      //child process
      for(int i = 0; i < LOOPS; i++){
        printf(1, "child process - PID %d ticks: %d\n", getpid(), ticks_run(getpid()));
      }
      exit();
    }
  } else {
    //parent process
    for(int i = 0; i < LOOPS; i++){
      printf(1, "parent process - PID %d ticks: %d\n", getpid(), ticks_run(getpid()));
    }
    exit();
  }
  
  exit();
}

