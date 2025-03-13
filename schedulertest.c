#include "types.h"
#include "stat.h"
#include "user.h"
#include "procinfo.h"

#define LOOPS 20

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

int main(void)
{
    int pid;

    for (int i = 0; i < LOOPS; i++)
    { // Loop to create child processes
        pid = fork();
        if (pid < 0)
        {
            printf(1, "fork failed\n");
            exit();
        }
        else if (pid == 0)
        {
            char *args[] = {"stressfs", 0};
            // In child process
            // Replace child process with one of our commands
            switch (i % 4)
            {
            case 0:
                exec("stressfs", args);
                printf(1, "exec failed\n");
                exit();
            case 1:
                args[0] = "find";
                exec("find", args);
                printf(1, "exec failed\n");
                exit();
            case 2:
                catreadmeuniq();
                exit();
            default:
                exit();
            }
        }
    }

    int turnaround = 0;
    int response = 0;
    // Wait for all child processes to finish
    for (int i = 0; i < LOOPS; i++)
    {
        struct procinfo pinfo;
        if (waitinfo(&pinfo) > 0)
        {
            printf(1, "num ticks: %d ready time: %d start time: %d end time: %d\n", pinfo.numticks, pinfo.readytime, pinfo.starttime, pinfo.exittime);
            turnaround += (pinfo.exittime - pinfo.readytime);
            response += (pinfo.starttime - pinfo.readytime);
        }
    }

    float avgturnaround = (float) turnaround / LOOPS;
    float avgresponse = (float) response / LOOPS;

    printf(1, "average turnaround time: %d\n", avgturnaround);
    printf(1, "average response time: %d\n", avgresponse);

    exit();
}