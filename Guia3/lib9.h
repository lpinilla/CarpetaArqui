int write(int fileDescriptor, void * buffer, int size);
int read(int fileDescriptor, void * buffer, int nOfLetters);
int open(const char *pathname, int flags, int mode);
int close(int fd);