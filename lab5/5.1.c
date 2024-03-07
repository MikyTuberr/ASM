#include <stdio.h>

float srednia_harm(float* tablica, unsigned int n);

int main()
{
	float chuj[] = { 1.2, 1.3, 2.6, 7.8, 5.2 };
	float cos = srednia_harm(chuj, sizeof(chuj) / sizeof(float));
	printf("%f", cos);
	return 0;
}
