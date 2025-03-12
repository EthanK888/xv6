#include "types.h"
#include "stat.h"
#include "user.h"

#define LOOPS 10000

int main(void)
{
    int pid;
    
    for (int i = 0; i < 10; i++) {  // Loop to create 10 child processes
        pid = fork();
        if (pid < 0) {
            printf(1, "fork failed\n");
            exit();
        } else if (pid == 0) {
            // In child process
            char *args[] = {"stressfs", 0};
            exec("stressfs", args);  // Replace child process with stressfs
            printf(1, "exec failed\n");  // If exec fails
            exit();
        }
    }

    // Wait for all child processes to finish
    for (int i = 0; i < 10; i++) {
        wait();
    }

    exit();
}