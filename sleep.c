#include "types.h"
#include "user.h"
#include "stat.h"

int main(int argc, char *argv[]) {
 
	//check if argument count is valid
	if (argc != 2){
		printf(2, "Error: Pass valid argument\n");
    	exit();
 	 }

	int NoOfTicks;
	NoOfTicks = atoi(argv[1]); //convert argument from string to int
	
	if (NoOfTicks > 0){
		sleep(NoOfTicks); //calling sleep system call
		exit();
	}
	else{
		printf(1, "ticks not valid\n");
		exit();
	}
}