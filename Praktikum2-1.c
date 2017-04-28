#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int magic(int n);

int main() {
	
	char text[] = "Das sollte nun auf dem Stack zu sehen sein";
	
	char *buffer = (char*) malloc(sizeof(text));
	strcpy(buffer, text);
	
	printf("%s", buffer);
}

