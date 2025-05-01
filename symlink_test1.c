#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main() {
  char *buffer = malloc(64);
  int fd, n, link1;

  //create a symlink pointing to "txtfile"
  link1 = symlink("txtfile", "symlink3");
  if (link1 < 0) {
    printf(1, "Failed to create symlink3\n");
    exit();
  }

  //create a link to the symlink (NOT the target file)
  link1 = link("symlink3", "link");
  if (link1 < 0) {
    printf(1, "Failed to create link to symlink3\n");
  } else {
    printf(1, "Created link to symlink3 named 'link'\n");
  }

  //open and read from 'link' using O_NOFOLLOW to get symlink content
  fd = open("link", O_RDONLY | O_NOFOLLOW); //this opens the file named link, but with O_NOFOLLOW meaning do not follow symlink
  if (fd < 0) {
    printf(1, "Failed to open 'link' with O_NOFOLLOW\n");
  } else {
    n = read(fd, buffer, 63);
    buffer[n] = '\0';
    printf(1, "Reading from 'link':\n");
    printf(1, "Read: %s\n", buffer);  //it should print the path txtfile. not opening txtfile.reading the content of the symlink file, which is just the text "txtfile".

    close(fd);
  }

  //unlink 'link'
  link1 = unlink("link");
  if (link1 < 0) {
    printf(1, "Failed\n");
  } else {
    printf(1, "link successfully unlinked\n");
  }

  //confirm original txtfile still exists
  printf(1, "Confirming original txtfile still exist : ");
  int test1 = open("txtfile", O_RDONLY);
  if (fd < 0) {
    printf(1, "txtfile missing!\n");
  } else {
    n = read(test1, buffer, 20);
    buffer[n] = '\0';
    printf(1, " %s\n", buffer);
    close(test1);
  }

  free(buffer);
  exit();
}
