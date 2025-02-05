Shehzeen Syed
Molly Fawcett
Ethan Kocses

(Ethan) I ran our xv6 directly on Ubuntu with an Intel i7-12700k processor. We shared the project using GitHub, where then Shehzeen and Molly cloned and ran it using WSL.

First, I looked into the working of the sleep command and how xv6 kernel implements it by examining the sysproc.c code.
I researched other files, such as echo.c and grep.c, to better understand command-line arguments, their operation, and how to use them in order to construct the sleep command.
Because of the similar logic, I found grep.c to be the most useful. Initially, I added an error if the argument count wasn't equal to two to ensure the user wouldn't forget the argument.
The argument that would be entered as a character was then changed to an integer using atoi. Additionally, I included a line stating that if the user enters anything other than a positive integer, the ticks are invalid.
Sleep system call was made if the arguments were correct. I then implemented make and make qemu-nox to test the program's functionality and added sleep to the UPROGS in Makefile. 

(Ethan) When completing find, the idea was to use our knowledge of the directory structure from working on ls since it is a similar command at it's core.
        So, I copied a lot of the code from ls.c to start off with and modified it from there. It ended up being very different from the ls code, but it was
        a good starting point. Then, I tested out what the find command was supposed to act like in a Linux terminal to guide me when creating all the functions
        of find in xv6. When implementing each of the flags, I wanted to make sure that they could be entered in any order, and either -name <name> or <folder>
        could be ommitted (not just both). I wasn't sure if all this was necessary, but it works that way in Linux so I did it to be safe. Furthermore, I decided
        not to allow multiple of the same flag to be entered because it did't seem like it worked properly in Linux, even if it was allowed. Technically,
        the printi flag is allowed to be entered multiple times in our find code, but since it's just a toggle I figured it didn't hurt to allow this.

(Molly) I have the git repo cloned on my pc at home (Windows AMD Ryzen 7 5800X using WSL) and also my macbook air which i was able to 
        just install qemu thru homebrew on and run. but im mostly doing dev on my pc. We all tackled the ls function together and I took on implementing uniq.
        I originally developed it with an assumption that a "line" would have a max size like 512 or 1024