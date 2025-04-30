#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(){
    //Test a small file
    int fd = open("test.txt", O_CREATE | O_EXTENT | O_RDWR);

    char* buffer = malloc(100);
    memmove(buffer, "This is a sentence\n", 19);

    printf(1, "Writing 19 bytes to test.txt\n");
    write(fd, buffer, 19);
    printf(1, "Done writing\n");

    printf(1, "Reading from test.txt\n");
    memset(buffer, 0, 100);
    lseek(fd, -19);
    read(fd, buffer, 19);
    printf(1, "buffer: %s\n", buffer);

    close(fd);

    //Test a large file
    fd = open("testlarge.txt", O_CREATE | O_EXTENT | O_RDWR);

    printf(1, "Writing 3328 (theoretical max) blocks to testlarge.txt\n");
    char* a = malloc(1703936);
    memset(a, 'a', 1703936);
    write(fd, a, 1703936);
    printf(1, "Done writing\n");

    close(fd);

    free(buffer);
    free(a);

    exit();
}