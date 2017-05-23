#include <stdlib.h>
#include <stdio.h>

int male(int n);
int female(int n);

int main() {
	
	int i;
	
	for(i=0; i < 10; i++) {
		
		int result = male(i);
		
		printf("Result: %d \n",result);
	}
	
	return 0;
}

int male(int n) {
	
	if(n == 0) {
		return female(n);
	}

	if(n > 0) {
		return n - male(female(n-1));
		// 1 - 
	}
	
	return 0;
}

int female(int n) {
	
	if(n == 0) {
		return 0;
	}
	
	if(n > 0) {
		return n - female(male(n-1));
	}
	
	return 0;
}
