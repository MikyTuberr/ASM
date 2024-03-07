#include <stdio.h>

float single_neuron(float* X, double* w, unsigned int n);

int main()
{
	float X[] = { 2.1,0.3 };
	double w[] = { 2.3,5.11,2.9 };
	float wynik;
	wynik = single_neuron(X, w, 3);
	printf("%f", wynik);
	return 0;
}
