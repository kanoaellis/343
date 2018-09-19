/**********************************************************************
A program that reverses all of the bytes in a file and writes it
into a different file
  
@author Kanoa Ellis
@version Fall 2018
 *********************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "file_utils.h"

/** Main only takes in three arguments: program name, file to read in,
 and the file to write to */
int main(int argc, char** argv){
	if (argc != 3){
		printf("Enter file to reverse and output file\n");
		return 0;
	}
	/** Will store the size of the file */
	int a;
	/** Buffer to store all of the bytes of the file */
	char *buf;
	buf = (char *)malloc(100 * sizeof(char));
	/** Pointer to buffer */
	char **buffer = &buf;
	a = read_file(argv[1], buffer);

	/** Will store the bytes in buf, but reversed */
	char *b;
	b = (char *)malloc(100 * sizeof(char));
	int j = 0;

	/** Store bytes in buf into b in reverse order */
	for (int i = strlen(buf) - 1; i >= 0; i--){
		b[i] = buf[j];
		j++;
	}

	write_file(argv[2], b, a);
	free(b);
	free(buf);
	return 0;
}
