#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(){
    int fd = open("test.txt", O_CREATE | O_EXTENT | O_RDWR);

    printf(1, "Writing to test.txt\n");
    char* buffer = malloc(100);
    buffer = "This is a sentence\n";
    write(fd, buffer, 19);
    printf(1, "Done writing\n");

    printf(1, "Reading from test.txt\n");
    memset(buffer, 0, 100);
    read(fd, buffer, 19);
    printf(1, "%s", buffer);

    close(fd);

    exit();
}