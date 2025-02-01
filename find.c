#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

char* fmtname(char *path)
{
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}

int main(int argc, char *argv[]){
  int i;
  int showHidden = 0;

  if (strcmp(argv[argc-1], "-a") == 0) {
    showHidden = 1;
    argc--;
  }
  if(argc < 2){
    ls(".", showHidden);
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i], showHidden);
  exit();
}