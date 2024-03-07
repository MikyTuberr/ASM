#include <stdio.h>

float objetosc_stozka(unsigned int big_r, unsigned int small_r, float h);

int main(void) {

	float a;

	a = objetosc_stozka(6, 2, 5.3);
	printf("%f\n", a);
	a = objetosc_stozka(7, 3, 4.2);
	printf("%f\n", a);
	a = objetosc_stozka(8, 4, 6.1);
	printf("%f\n", a);

	return 0;
}