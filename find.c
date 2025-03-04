#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

//Function to get the file/directory name at the end of path input
char*
fmtname(char *path)
{
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;

  return p;
}

void find(char *path, char *name, char *type, char *inum, int printi)
{
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
    printf(2, "find: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
    printf(2, "find: cannot stat %s\n", path);
    close(fd);
    return;
  }

  //If inum flag is entered, check for + or - and convert input num to int
  int inodenum = -1;
  int inumCompare = -1;

  if(inum != (void *)0){
    char* temp = malloc(DIRSIZ);
    //0 checks for equivalent inum, 1 for greater inums, 2 for smaller inums
    inumCompare = 0;
    if(inum[0] == '+'){
      inumCompare = 1;
      memmove(temp, inum+1, strlen(inum)-1);
      inodenum = atoi(temp);
    }
    else if(inum[0] == '-'){
      inumCompare = 2;
      memmove(temp, inum+1, strlen(inum)-1);
      inodenum = atoi(temp);
    }
    else inodenum = atoi(inum);

    if(inodenum == 0){
      printf(2, "find: incorrect inum entered\n");
      exit();
    }

    free(temp);
  }

  switch(st.type){
  case T_FILE:
    //Check which flags were entered and only print if the correct criteria are met
    if((name == (void *)0 || strcmp(name, fmtname(path)) == 0)
      && (type == (void *)0 || strcmp(type, "f") == 0)
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
        if(printi == 1) printf(1, "%d ", st.ino);
        printf(1, "%s\n", path);
      }
    break;

  case T_DIR:
  //Check which flags were entered and only print if the correct criteria are met
    if((name == (void *)0 || strcmp(name, fmtname(path)) == 0)
      && (type == (void *)0 || strcmp(type, "d") == 0)
      && (inum == (void *)0 || (inumCompare == 0 && st.ino == inodenum) || (inumCompare == 1 && st.ino > inodenum) || (inumCompare == 2 && st.ino < inodenum))){
        if(printi == 1) printf(1, "%d ", st.ino);
        printf(1, "%s\n", path);
      }

    if(strlen(path) + 1 + DIRSIZ + 1 > 512){
      printf(1, "find: path too long\n");
      close(fd);
      return;
    }

    //Loop through all objects in current directory
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;

      //Call find on next file/directory unless it is the . or .. directory
      if(strcmp(de.name, ".") != 0 && strcmp(de.name, "..") != 0){
        char *newPath = malloc(strlen(path) + strlen(de.name) + 2);
        if (!newPath) {
            printf(2, "find: failed to allocate memory\n");
            close(fd);
            exit();
        }

        //Create the new path to find
        memmove(newPath, path, strlen(path));
        newPath[strlen(path)] = '/';
        memmove(newPath + strlen(path) + 1, de.name, strlen(de.name) + 1);

        find(newPath, name, type, inum, printi);
        free(newPath);
      }
    }
    close(fd);
    break;
  }
  close(fd);
}

int main(int argc, char *argv[]){
  //If only find is entered, call find with no flags (null pointers) and . as directory
  if(argc < 2) find(".", (void *)0, (void *)0, (void *)0, 0);
  //If any other args are entered, allow them to appear in any order
  else{
    //Assign null pointers to flags if nothing is entered
    char *path = malloc(DIRSIZ);
    char *name = (void *)0;
    char *type = (void *)0;
    char *inum = (void *)0;
    int printi = 0;

    for(int i = 1; i < argc; i++){
      //If a directory to search is not provided, default to "." (1st arg should always be directory)
      if(i == 1 && strcmp(argv[1], "-name") != 0 && strcmp(argv[1], "-type") != 0 && strcmp(argv[1], "-inum") != 0 && strcmp(argv[1], "-printi") != 0){
        memmove(path, argv[1], strlen(argv[1]));
        continue;
      }
      else if(i == 1) memmove(path, ".", 1);

      //Check for name flag
      if(strcmp(argv[i], "-name") == 0 && name == (void *)0){
        name = malloc(DIRSIZ);
        
        if(i == argc - 1){
          printf(2, "find: no name entered\n");
          exit();
        }

        //Next arg is name
        memmove(name, argv[i+1], strlen(argv[i+1]));
        i++;
        continue;
      }
      //Check for type flag
      else if(strcmp(argv[i], "-type") == 0 && type == (void *)0){
        type = malloc(DIRSIZ);
        if(i == argc - 1){
          printf(2, "find: no type entered\n");
          exit();
        }
        else if(strcmp(argv[i+1], "f") != 0 && strcmp(argv[i+1], "d") != 0){
          printf(2, "find: incorrect type provided\n");
          exit();
        }
        
        //Next arg is type
        memmove(type, argv[i+1], strlen(argv[i+1]));
        i++;
        continue;
      }
      //Check for inum flag
      else if(strcmp(argv[i], "-inum") == 0 && inum == (void *)0){
        inum = malloc(DIRSIZ);
        
        if(i == argc - 1){
          printf(2, "find: no inum entered\n");
          exit();
        }

        //Next arg is inum
        memmove(inum, argv[i+1], strlen(argv[i+1]));
        i++;
        continue;
      }
      //Check for printi flag
      else if(strcmp(argv[i], "-printi") == 0) printi = 1;
      //Anything else (or if valid flag was already used) an error message is printed
      else{
        printf(2, "find: incorrect flag entered\n");
        exit();
      }
    }

    find(path, name, type, inum, printi);

    free(path);
    if(name != (void *)0) free(name);
    if(type != (void *)0) free(type);
    if(inum != (void *)0) free(inum);
  }
  exit();
}