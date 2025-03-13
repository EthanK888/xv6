#ifndef PROCINFO_H
#define PROCINFO_H

struct procinfo {
    int pid;
    int numticks;                
    int readytime;               
    int starttime;                
    int exittime;
  };

#endif