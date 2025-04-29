#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(){
    //Test a small file
    int fd = open("test.txt", O_CREATE | O_EXTENT | O_RDWR);

    printf(1, "Writing to test.txt\n");
    char* buffer = malloc(100);
    memmove(buffer, "This is a sentence\n", 19);
    write(fd, buffer, 19);
    printf(1, "Done writing\n");

    printf(1, "Reading from test.txt\n");
    printf(1, "test0\n");
    memset(buffer, 0, 100);
    printf(1, "test1\n");
    lseek(fd, -19);
    printf(1, "test2\n");
    read(fd, buffer, 19);
    printf(1, "buffer: %s\n", buffer);

    close(fd);

    //Test a large file
    fd = open("testlarge.txt", O_CREATE | O_EXTENT | O_RDWR);

    printf(1, "Writing to testlarge.txt\n");
    char* a = malloc(1000000);
    memset(a, 'a', 1000000);
    write(fd, a, 1000000);
    printf(1, "Done writing\n");

    close(fd);

    free(buffer);
    free(a);
    
    exit();
}