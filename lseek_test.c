#include "types.h"
#include "stat.h"
#include "user.h"

int main(){
    printf(1, "Opening txtfile...\n");
    int fd = open("txtfile", 2);

    char* buffer = malloc(10 * sizeof(char));
    
    //Read 10 characters
    printf(1, "\nReading the first 10 characters:\n");
    read(fd, buffer, 10);
    printf(1, "%s\n", buffer);

    //Skip 10 characters and read 10 more
    printf(1, "\nlseek 10 characters then read the next 10:\n");
    lseek(fd, 10);
    read(fd, buffer, 10);
    printf(1, "%s\n", buffer);

    //Read out of bounds
    printf(1, "\nAttempt to read outside of file size:\n");
    lseek(fd, 100000);
    read(fd, buffer, 10);
    printf(1, "%s\n", buffer);

    //Seek back to the beginning and write hi
    printf(1, "\nWrite \"hi\\n\" at the beginning of the file\n");
    lseek(fd, -100030);
    write(fd, "hi\n", 3);
    
    //Skip 10 characters and write hi
    printf(1, "lseek 10 characters then write \"hi\\n\"\n");
    lseek(fd, 10);
    write(fd, "hi\n", 3);

    //Go outside of file size and write
    printf(1, "lseek outside of the file size then write \"hi\\n\"\n");
    lseek(fd, 180);
    write(fd, "hi\n", 3);

    close(fd);
    exit();
}