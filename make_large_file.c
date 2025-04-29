#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(){
    int fd = open("largefile.txt", O_CREATE | O_WRONLY);
    char* a = malloc(8388608);
    memset(a, 'a', 8388608);

    printf(1, "Writing 71168 bytes (139 blocks) to largefile.txt...\n");
    write(fd, a, 71168);

    printf(1, "Writing 8388608 more bytes (16,523 blocks total) to largefile.txt...\n");
    write(fd, a, 8388608);

    printf(1, "Writing 512 more bytes (16,524 blocks total) to largefile.txt...\n");
    write(fd, a, 512);

    close(fd);
    free(a);

    exit();
}