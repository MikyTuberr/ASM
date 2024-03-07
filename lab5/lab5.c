#include <stdio.h>

void szybki_max(short int t_1[], short int t_2[], short int t_wynik[], int n);

float dylatacja_czasu(unsigned int delta_t_zero, float predkosc);

int main(void) {

	float wynik;

	wynik = dylatacja_czasu(10, 10000.0f); // wynik = 10.00000
	printf("%f\n", wynik);
	wynik = dylatacja_czasu(10, 200000000.0f); // wynik = 13.41641
	printf("%f\n", wynik);
	wynik = dylatacja_czasu(60, 270000000.0f); // wynik = 137.64944
	printf("%f\n", wynik);

	short int val1[16] = { 1, -1, 2, -2, 3, -3, 4, -4, 5, -5, 6, -6, 7, -7, -8, 8 };

	short int val2[16] = { -3, -2, -1, 0, 1, 2, 3, 4, 256, -256, 257, -257, 258, -258, 0, 0 };

	short int wynik2[16] = { 0 };
	szybki_max(val1, val2, wynik2, 16); // -> wynik = {1, -1, 2, 0, 3, 2, 4, 4, 256, -5, 257, -6, 258, -7, 0, 8}

	for (int i = 0; i < 16; i++) {
		printf("%d ", wynik2[i]);
	}

	return 0;
}