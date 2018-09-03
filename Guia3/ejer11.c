#include <stdio.h>

int fibonacci(int n);

int main(){
	printf("%d \n", fibonacci(3));
}

int fibonacci(int n){
	if(n == 1) return 1;
	return n + fibonacci(n-1);
}