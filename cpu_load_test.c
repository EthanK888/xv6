#include "types.h"
#include "stat.h"
#include "user.h"

#define LOOPS 2000000000

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
  int pid, mypid;
  volatile int test = 0;
  int startTime, endTime;

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
        mypid = getpid();
        printf(1, "grandchild process - PID %d\n", mypid);
        #ifdef STRIDE
            printf(1, "grandchild process - tickets: %d\n", num_tickets(mypid));
        #elif defined(LOTTERY)
            printf(1, "grandchild process - tickets before set: %d\n", get_tickets(mypid));
            set_tickets(100);
            printf(1, "grandchild process - tickets after set: %d\n", get_tickets(mypid));
        #endif

        startTime = uptime();

        for(int i = 0; i < LOOPS; i++){
            test++;
        }

        endTime = uptime();

        printf(1, "grandchild process - process ticks after loops: %d\n", ticks_run(mypid));
        printf(1, "grandchild process - total time to run: %d\n", endTime - startTime);

        exit();
    }
    else{
        //child process
        mypid = getpid();
        printf(1, "child process - PID %d\n", mypid);
        #ifdef STRIDE
            printf(1, "child process - tickets: %d\n", num_tickets(mypid));
        #elif defined(LOTTERY)
            printf(1, "child process - tickets before set: %d\n", get_tickets(mypid));
            set_tickets(60);
            printf(1, "child process - tickets after set: %d\n", get_tickets(mypid));
        #endif

        startTime = uptime();

        for(int i = 0; i < LOOPS; i++){
            test++;
        }
        
        endTime = uptime();

        printf(1, "child process - process ticks after loops: %d\n", ticks_run(mypid));
        printf(1, "child process - total time to run: %d\n", endTime - startTime);

        wait();
        exit();
    }
  } else {
        //parent process
        mypid = getpid();
        printf(1, "parent process - PID %d\n", mypid);
        #ifdef STRIDE
            printf(1, "parent process - tickets: %d\n", num_tickets(mypid));
        #elif defined(LOTTERY)
            printf(1, "parent process - tickets before set: %d\n", get_tickets(mypid));
            set_tickets(10);
            printf(1, "parent process - tickets after set: %d\n", get_tickets(mypid));
        #endif

        startTime = uptime();

        for(int i = 0; i < LOOPS; i++){
            test++;
        }

        endTime = uptime();

        printf(1, "parent process - process ticks after loops: %d\n", ticks_run(mypid));
        printf(1, "parent process - total time to run: %d\n", endTime - startTime);

        wait();
        exit();
  }
  
  exit();
}

