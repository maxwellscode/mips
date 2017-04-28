#include <stdlib.h>
#include <stdio.h>

int magic(int n);

int main() {

	printf("%d" , magic(90));
}

int magic(int n) {

	if(n > 100) {
		return n - 10;
	}
	
	if(n <= 100) {
		return magic(magic(n+11));
	}
	
	return 0;
}