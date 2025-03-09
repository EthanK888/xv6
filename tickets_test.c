#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf(1, "Usage: num_tickets <pid>\n");
        exit();
    }

    int pid = atoi(argv[1]);
    int tickets = num_tickets(pid);

    if (tickets == -1) {
        printf(1, "Process not found or not runnable\n");
    } else {
        printf(1, "Process %d has %d tickets\n", pid, tickets);
    }

    exit();
}
