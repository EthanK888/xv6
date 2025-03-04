#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

char*
fmtname(char *path, short type)
{
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;

  // Return blank-padded name, no padding if strlen(p) >= DIRSIZ
  if(strlen(p) >= DIRSIZ){
    if(type == T_DIR){
      //Add '/' if directory
      memset(p+strlen(p), '/', 1);
    }
    return p;
  }

  //Move file name into buf
  memmove(buf, p, strlen(p));

  if(type == T_FILE){
    //Pad it
    memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  }
  //If directory, add '/' then pad
  else if(type == T_DIR){
    memset(buf+strlen(p), '/', 1);
    memset(buf+strlen(p)+1, ' ', DIRSIZ-strlen(p)+1);
  }
  return buf;
}

void
ls(char *path, int showHidden)
{
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  //Open file at end of path
  if((fd = open(path, 0)) < 0){
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  //Save info about the opened file into st using fstat
  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path, st.type), st.type, st.ino, st.size);
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';

    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      } else {
        char *filename = fmtname(buf, st.type);
        if (showHidden || *filename != '.')
        {
          printf(1, "%s %d %d %d\n", filename, st.type, st.ino, st.size);
        }
      }
    }
    break;
  }
  close(fd);
}

int
main(int argc, char *argv[])
{
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
