#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[]) {
 
	//check if argument count is valid
	if (argc != 2){
		printf(2, "Error: Pass valid argument\n");
    	exit();
 	}

    struct stat st;
    char* path = argv[1];
    int error = stat(path, &st);
    if(error == -1){
        printf(2, "Stat failed\n");
        exit();
    }

    //Print pointer file info
    if(st.type == T_FILE){
        printf(1, "File type: T_FILE\n");
        printf(1, "Size: %d\n", st.size);
        for(int i = 0; i < 11; i++){
            if(st.addrs[i] == 0) printf(1, "Direct block %d not allocated\n", i);
            else printf(1, "Direct block %d points to block %d\n", i, st.addrs[i]);
        }

        if(st.addrs[11] == 0) printf(1, "Indirect block not allocated\n");
        else printf(1, "Indirect block allocated\n");

        if(st.addrs[12] == 0) printf(1, "Doubly indirect block not allocated\n");
        else printf(1, "Doubly indirect block allocated\n");
    }
    //Print extent file info
    if(st.type == T_EXTENT){
        printf(1, "File type: T_EXTENT\n");
        printf(1, "Size: %d\n", st.size);
        for(int i = 0; i < 13; i++){
            if(st.addrs[i] == 0) printf(1, "Extent %d not allocated\n", i);
            else{
                uint length = st.addrs[i] & 0xFF;
                uint addr = st.addrs[i] >> 8;
                printf(1, "Extent %d starts at block %d and holds %d blocks\n", i, addr, length+1);
            }
        }
    }

    exit();
}