#include "types.h"
#include "stat.h"
#include "user.h"

// functionality based off the structure of the cat program!
#define MAX_LINE 512 // assume a line will never be longer than 512 bytes

#define I 1
#define S 2
#define D 3

// print based on flag
// this is always called on the LAST occurence in a row of a line.
void printuniqueline(char *line, int count, int flag)
{
    if (flag == S)
    {
        // print number & value
        printf(1, "%d %s\n", count, line);
    }
    else if (flag == D)
    {
        // print value ONLY IF number > 1
        if (count > 1)
        {
            printf(1, "%s\n", line);
        }
    }
    else
    {
        // print value
        printf(1, "%s\n", line); // print unique line
    }
}

void uniq(int fd, int flag)
{
    char buf[1]; // for reading one char at a time
    char line[MAX_LINE];
    char lastline[MAX_LINE];
    int lastcount = 1; // once repeated line
    int index = 0;

    while (read(fd, buf, 1) == 1)
    { // read one byte at a time until EOF
        if (buf[0] == '\n' || index == MAX_LINE - 1)
        {                       // end line at \n OR buffer full
            line[index] = '\0'; // null terminates (so that trailing characters wont get leftover)
            // new unique line found!
            if (strcmp(line, lastline) != 0)
            {
                if (*lastline != '\0') printuniqueline(lastline, lastcount, flag); // print last line
                strcpy(lastline, line);                     // reset last line to start the count over
                lastcount = 1;
            }
            else
            {
                lastcount++;
            }
            index = 0;
        }
        else
        {
            // if (flag == I) buf[0] = tolower(buf[0]); //to lower everything for the i flag
            line[index++] = buf[0]; // add another char to our line
        }
    }

    if (index > 0)
    { // Print last line if no trailing '\n'
        line[index] = '\0';
        printuniqueline(line, lastcount, flag);
    }
}

// i took this main function from the cat program as a base, and edited to fit our needs
int main(int argc, char *argv[])
{
    int fd, i;
    char *arg;
    char *filename = 0;
    int flag = 0; // no flag

    if (argc <= 1)
    {
        exit();
    }

    for (i = 1; i < argc; i++)
    {
        arg = argv[i];
        if (*arg == '-')
        {
            arg++;
            char letter = *arg;
            switch (letter)
            {
            case 's':
                flag = S;
                break;
            case 'i':
                flag = I;
                break;
            case 'd':
                flag = D;
                break;
            }
        }
        else
        {
            filename = argv[i];
        }
    }
    if ((fd = open(filename, 0)) < 0)
    {
        printf(1, "uniq: cannot open %s\n", argv[i]);
        exit();
    }
    uniq(fd, flag);
    close(fd);
    exit();
}
