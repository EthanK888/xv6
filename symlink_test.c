#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(){
    symlink("txtfile", "symlink1");
    int symlink1 = open("symlink1", O_RDONLY);
    char* buffer = malloc(10 * sizeof(char));
    read(symlink1, buffer, 10);
    printf(1, buffer);


    exit();
}