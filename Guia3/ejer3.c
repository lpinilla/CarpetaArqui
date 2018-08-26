#include <stdio.h>
#include <stdlib.h>

#define STDOUT 1

int sys_write(int fd, void *buffer, int size);

int main(){
	char string[] = {'h', 'o', 'l', 'a', '\n' ,'\0'};
	puts(string);
	return 0;
}

int puts(const char * string){
	//int length = strlen(string);
	int length = 6;
	return sys_write(STDOUT, (void *) string, length);
}