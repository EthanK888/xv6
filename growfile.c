#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#define BLOCK_SIZE 512
#define TOTAL_BLOCKS 16523

int
main(int argc, char *argv[])
{
  int fd;
  char buf[BLOCK_SIZE];
  int i;

  for (i = 0; i < BLOCK_SIZE; i++)
    buf[i] = 'A';

  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "failed to open bigfile\n");
    exit();
  }

  for (i = 0; i < TOTAL_BLOCKS; i++) {
    if (write(fd, buf, BLOCK_SIZE) != BLOCK_SIZE) {
      printf(1, "write failed at block %d\n", i);
      close(fd);
      exit();
    }
    if (i % 100 == 0)
      printf(1, "wrote block %d\n", i);
  }

  printf(1, "Successfully wrote %d blocks!\n", TOTAL_BLOCKS);
  close(fd);
  exit();
}
