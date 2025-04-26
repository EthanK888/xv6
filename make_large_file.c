#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(){
    int fd = open("largefile.txt", O_CREATE | O_WRONLY);
    char* a = malloc(8388096);
    memset(a, 'a', 8388096);
    //printf(1, "%s\n", a);

    printf(1, "Writing 71680 bytes (140 blocks) to largefile.txt...\n");
    write(fd, a, 71680);

    printf(1, "Writing 8388096 more bytes (16,523 blocks total) to largefile.txt...\n");
    write(fd, a, 8388096);
    
    close(fd);
    free(a);

    exit();
}