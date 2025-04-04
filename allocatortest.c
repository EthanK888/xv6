#include "types.h"
#include "stat.h"
#include "user.h"

#define PGSIZE 4096

void mem_access(char *mem, int pages) {
    int i;
    printf(1, "\nWriting to memory:\n");
    for(i = 0; i < pages; i++) {
        printf(1, "Accessing page %d at 0x%x\n", i, (uint)(mem + i * PGSIZE));
        mem[i * PGSIZE] = 'A' + i; //printing out characters consecutively
        printf(1, "Successfully wrote '%c'\n", mem[i * PGSIZE]);
        
        //read back to verify
        //printf(1, "Read back: '%c'\n\n", mem[i * PGSIZE]);
    }
}

int main(void) {
    printf(1, "\nStarting allocator test...\n");
    printf(1, "Mode: %s\n\n", 
        #ifdef LOCALITY
            "LOCALITY"
        #else
            "LAZY"
        #endif
    );

    //allocate 5 pages
    char *mem = sbrk(PGSIZE * 5);
    if(mem == (char*)-1) {
        printf(1, "sbrk failed\n");
        exit();
    }

    mem_access(mem, 5);

    printf(1, "Test done\n");
    exit();
}