#include "types.h"
#include "stat.h"
#include "user.h"

int main(){
    int fd = open("txtfile", 2);

    char* buffer = malloc(10 * sizeof(char));
    
    //Read 10 characters
    read(fd, buffer, 10);
    printf(1, "%s\n", buffer);

    //Skip 10 characters and read 10 more
    lseek(fd, 10);
    read(fd, buffer, 10);
    printf(1, "%s\n", buffer);

    //Read out of bounds
    lseek(fd, 100000);
    read(fd, buffer, 10);
    printf(1, "%s\n", buffer);

    //Seek back to the beginning and write hi
    lseek(fd, -100020);
    write(fd, "hi\n", 3);
    
    //Skip 10 characters and write hi
    lseek(fd, 10);
    write(fd, "hi\n", 3);

    close(fd);
    exit();
}