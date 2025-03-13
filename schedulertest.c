#include "types.h"
#include "stat.h"
#include "user.h"
#include "procinfo.h"

#define LOOPS 10

int main(void)
{
    int pid;

    for (int i = 0; i < LOOPS; i++)
    { // Loop to create 10 child processes
        sleep(5);
        pid = fork();
        if (pid < 0)
        {
            printf(1, "fork failed\n");
            exit();
        }
        else if (pid == 0)
        {
            // In child process
            char *args[] = {"stressfs", 0};
            exec("find", args);     // Replace child process with stressfs
            printf(1, "exec failed\n"); // If exec fails
            exit();
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

    int avgturnaround = turnaround / LOOPS;
    int avgresponse = response / LOOPS;

    printf(1, "average turnaround time: %d\n", avgturnaround); 
    printf(1, "average response time: %d\n", avgresponse); 

    exit();
}