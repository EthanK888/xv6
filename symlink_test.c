#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(){
    //Create a symlink to txtfile
    symlink("txtfile", "symlink1");
    int symlink1 = open("symlink1", O_RDONLY);
    char* buffer = malloc(10 * sizeof(char));
    read(symlink1, buffer, 10);
    printf(1, buffer);

    close(symlink1);

    //Create a loop of symlinks (should fail to open)
    symlink("symlinkLoop1", "symlinkLoop2");
    symlink("symlinkLoop2", "symlinkLoop1");

    //Read from the symlink using O_NOFOLLOW
    char* buffer2 = malloc(7 * sizeof(char));
    symlink1 = open("symlink1", O_NOFOLLOW);
    read(symlink1, buffer2, 7);
    printf(1, "Read from symlink using O_NOFOLLOW: %s\n", buffer2);

    //Testing that link and unlink don't follow symlinks
    /*link("symlink1", "link");
    int link = open("link", O_RDONLY);
    read(link, buffer2, 7);
    printf(1, "Reading from link. If it reads the path that symlink1 holds, then it didn't follow the symlink.\n%s\n", buffer2);
    unlink("link");*/

    close(symlink1);
    //close(link);

    free(buffer);
    free(buffer2);

    exit();
}