#include <stdio.h>
#include "lib9.h"

int main(){
	int fileDescriptor, index = 0, linecounter = 0, size;
	char buffer[15];	
	fileDescriptor = open("./test", 0, 1);
	read(fileDescriptor, buffer, 15); //leer de a 15	
	buffer[14] = 0;
	printf("%s\n", buffer);
	close(fileDescriptor);
	return 0;
}


