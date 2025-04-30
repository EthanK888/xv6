#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(){
    int intercept = open("intercept.txt", O_CREATE | O_WRONLY);
    int fd = open("break.txt", O_CREATE | O_EXTENT | O_WRONLY);

    char* a = malloc(1000000);
    memset(a, 'a', 1000000);

    printf(1, "Writing 3328 (theoretical max) blocks to break.txt\n");
    write(fd, a, 1000000);

    printf(1, "Writing to intercept.txt\n");
    write(intercept, a, 10000);
    printf(1, "Done writing to intercept.txt\n");

    printf(1, "Continuing write to break.txt\n");
    write(fd, a, 703936);
    printf(1, "Done writing to break.txt\n");

    close(intercept);
    close(fd);

    exit();
}