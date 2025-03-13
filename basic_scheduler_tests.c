#include "types.h"
#include "stat.h"
#include "user.h"

#define LOOPS 2000000000

void catreadmeuniq();

int main(){
  int mypid;
  mypid = getpid();
  
  #ifdef STRIDE
    int no_tickets;
    //Initial process tickets
    printf(1, "current process- PID %d tickets: %d\n", mypid, num_tickets(mypid));

    //process does not exist
    no_tickets = num_tickets(9999);
    printf(1, "non existent process tickets: %d\n", no_tickets);
  #elif defined(LOTTERY)
    int no_tickets;

    //Initial process tickets
    printf(1, "current process- PID %d tickets: %d\n", mypid, get_tickets(mypid));

    //process does not exist
    no_tickets = get_tickets(9999);
    printf(1, "non existent process tickets: %d\n", no_tickets);
    
    no_tickets = set_tickets(10);
    if(no_tickets == -1) printf(1, "Tried to set tickets for a non existent process\n");
  #endif


  volatile int test = 0;
  for(int i = 0; i < LOOPS; i++){
    test++;
  }
  
  printf(1, "process ticks after many loops: %d\n", ticks_run(mypid));
  
  int startTime, endTime;

  //Testing cpu_load_test
  startTime = uptime();
  int pid = fork();
  if(pid < 0) printf(1, "fork failed\n");
  else if(pid == 0){
    //child; runs cpu_load_test
    printf(1, "Running cpu_load_test...\n\n");

    char *args[] = {"cpu_load_test", 0};
    exec("cpu_load_test", args);
    
    printf(1, "exec failed\n");
    exit();
  }
  else{
    wait();
    endTime = uptime();
    printf(1, "Time to fork and run cpu_load_test: %d\n\n", endTime - startTime);
  }

  //Testing stressfs
  startTime = uptime();
  pid = fork();
  if(pid < 0) printf(1, "fork failed\n");
  else if(pid == 0){
    //child; stressfs
    printf(1, "Running stressfs...\n\n");

    char *args[] = {"stressfs", 0};
    exec("stressfs", args);
    
    printf(1, "exec failed\n");
    exit();
  }
  else{
    wait();
    endTime = uptime();
    printf(1, "Time to fork and run stressfs: %d\n\n", endTime - startTime);
  }

  //Testing find
  startTime = uptime();
  pid = fork();
  if(pid < 0) printf(1, "fork failed\n");
  else if(pid == 0){
    //child; find
    printf(1, "Running find...\n\n");

    char *args[] = {"find", 0};
    exec("find", args);
    
    printf(1, "exec failed\n");
    exit();
  }
  else{
    wait();
    endTime = uptime();
    printf(1, "Time to fork and run find: %d\n\n", endTime - startTime);
  }

  //Testing cat README | uniq
  startTime = uptime();
  pid = fork();
  if(pid < 0) printf(1, "fork failed\n");
  else if(pid == 0){
    //child; cat README | uniq
    printf(1, "Running cat README | uniq...\n\n");

    catreadmeuniq();
    exit();
  }
  else{
    wait();
    endTime = uptime();
    printf(1, "Time to fork and run cat README | uniq: %d\n\n", endTime - startTime);
  }

  exit();
}

void catreadmeuniq() {
    int fd[2]; 
    if (pipe(fd) < 0) {
        printf(2, "Pipe failed\n");
        exit();
    }

    if (fork() == 0) {
        //run cat readme
        close(fd[0]);  
        close(1);       
        dup(fd[1]);    
        close(fd[1]);  
        char *args[] = {"cat", "README"};
        exec("cat", args);
        printf(2, "Exec cat failed\n"); 
        exit();
    }

    if (fork() == 0) {
        // run uniq
        close(fd[1]);  
        close(0);      
        dup(fd[0]);    
        close(fd[0]);  
        char *args[] = {"uniq", 0};
        exec("uniq", args);
        printf(2, "Exec uniq failed\n");
        exit();
    }

    close(fd[0]);
    close(fd[1]);
    wait();
    wait();
    exit();
}