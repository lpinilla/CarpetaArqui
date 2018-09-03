//libc.c
#define STDOUT 1

int sys_write(int fd, void *buffer, int size);
int strlen(const char* str);

int puts(const char* str) {
     //int len = strlen(str);
	int len = 11;
    return sys_write(STDOUT, (void *) str, len);
}

int main(){
	puts("hello world");
	return 0;
}