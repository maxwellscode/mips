#include<stdio.h>

float a[5][5] = {
	
	{1.0, 2.0, 3.0, 4.0, 5.0},
	{2.0, 3.0, 4.0, 5.0, 6.0},
	{3.0, 4.0, 5.0, 6.0, 7.0},
	{4.0, 5.0, 6.0, 7.0, 8.0},
	{5.0, 6.0, 7.0, 8.0, 9.0},

};

float v[5] = {1.0, -2.0, 3.0, -4.0, 5.0};

void vect_mul(float* result, float matrix[5][5], float* vector, int size) { 
	
	int i, j;
	float sum = 0.0;
	
	for (i = 0; i < size; i++) {
		sum = 0.0;
		
		for (j= 0; j < size; j++) {
			sum += matrix[i][j] * vector[j]; 
		}
		
		result[i] = sum;
	}
}
		


int main() { 
	
	float b[5]; 
	int i;
	
	vect_mul(b, a, v, 5);
	
	for(i=0; i < 5;i++) {
		
		printf("%f\n", b[i]);
	}
	
	
	return 0;
}