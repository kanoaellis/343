/**********************************************************************
Functions for reading and writing files

@author Kanoa Ellis
@version Fall 2018
**********************************************************************/
#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include "file_utils.h"

/**********************************************************************
Reads in a file and stores bytes into a buffer
@param filename is name of the file to read
@param buffer will hold the bytes of the file
@return file size
**********************************************************************/
int read_file(char* filename, char **buffer){
	/** Opens file and seeks to end */
	FILE *fp = fopen(filename, "r");
	fseek(fp, 0, SEEK_END);
	/** stores file size */
	int b = ftell(fp);
	fclose(fp);
	/** Initializing buf to the size of the file */
	*buffer = (char *)malloc(b * sizeof(char));

	/** Opens file again to reset pointer to file and then reads
	bytes from the file into buffer */
	FILE *f = fopen(filename, "r");
	if (f == NULL) {
		printf("Cannot find file: %s\n", filename);
	}
	else {
		fread(*buffer, sizeof(char), b, f);
	}
	fclose(f);
	return b;
}

/**********************************************************************
Writes bytes in buffer into a file
@param filename is name of file to write to
@param buffer holds bytes that will be written to the file
@param size is the amount of bytes in buffer
@return none
**********************************************************************/
int write_file(char *filename, char *buffer, int size){
	/** Opens file and writes to it */
	FILE *fr = fopen(filename, "w");
	if (fr == NULL) {
		printf("Cannot open file\n");
	}
	else {
		fwrite(buffer, sizeof(char), size, fr);
	}
	fclose(fr);
	return 0;
}
