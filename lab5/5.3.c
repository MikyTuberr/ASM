#include <stdio.h>
void dodaj_SSE(float*, float*, float*);
void pierwiastek_SSE(float*, float*);
void odwrotnosc_SSE(float*, float*);
void dodaj_SSE2(char*, char*, char*);

int main()
{
	float p[4] = { 1.0, 1.5, 2.0, 2.5 };
	float q[4] = { 0.25, -0.5, 1.0, -1.75 };
	float r[4];

	char liczby_A[16] = { -128, -127, -126, -125, -124, -123, -122,
	-121, 120, 121, 122, 123, 124, 125, 126, 127 };

	char liczby_B[16] = { -3, -3, -3, -3, -3, -3, -3, -3,
	3, 3, 3, 3, 3, 3, 3, 3 };

	char wynik[16];
	dodaj_SSE2(&liczby_A, &liczby_B, &wynik);


	for (int i = 0; i < 16; i++)
	{
		printf("%d ", wynik[i]);
	}


	/*dodaj_SSE(p, q, r);
	printf("\n%f %f %f %f", p[0], p[1], p[2], p[3]);
	printf("\n%f %f %f %f", q[0], q[1], q[2], q[3]);
	printf("\n%f %f %f %f", r[0], r[1], r[2], r[3]);
	printf("\n\nObliczanie pierwiastka");
	pierwiastek_SSE(p, r);
	printf("\n%f %f %f %f", p[0], p[1], p[2], p[3]);
	printf("\n%f %f %f %f", r[0], r[1], r[2], r[3]);
	printf("\n\nObliczanie odwrotno�ci - ze wzgl�du na \
stosowanie");
	printf("\n12-bitowej mantysy obliczenia s� ma�o dok�adne");
	odwrotnosc_SSE(p, r);
	printf("\n%f %f %f %f", p[0], p[1], p[2], p[3]);
	printf("\n%f %f %f %f", r[0], r[1], r[2], r[3]);*/
	return 0;
}