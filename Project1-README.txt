Shehzeen Syed
Molly Fawcett
Ethan Kocses

(Ethan) I ran our xv6 directly on Ubuntu with an Intel i7-12700k processor. We shared the project using GitHub, where the Shehzeen and Molly cloned and ran it using WSL.

(Ethan) When completing find, the idea was to use our knowledge of the directory structure from working on ls since it is a similar command at it's core.
        So, I copied a lot of the code from ls.c to start off with and modified it from there. It ended up being very different from the ls code, but it was
        a good starting point. Then, I tested out what the find command was supposed to act like in a Linux terminal to guide me when creating all the functions
        of find in xv6. When implementing each of the flags, I wanted to make sure that they could be entered in any order, and either -name <name> or <folder>
        could be ommitted (not just both). I wasn't sure if all this was necessary, but it works that way in Linux so I did it to be safe. Furthermore, I decided
        not to allow multiple of the same flag to be enetered because it did't seem like it worked properly in Linux, even if it was allowed. Technically,
        the printi flag is allowed to be entered multiple times in our find code, but since it's just a toggle I figured it didn't hurt to allow this.