#include <stdio.h>

int szukaj_max(int a, int b, int c, int d);

int main()
{
	int x, y, z, d, wynik;
	printf("\nProsze podac trzy liczby calkowite ze znakiem: ");
	scanf_s("%d %d %d %d", &x, &y, &z, &d, 32);
	wynik = szukaj_max(x, y, z, d);
	printf("\nSposród podanych liczb %d, %d, %d, %d, liczba %d jest najwieksza\n", x, y, z, d, wynik);
	return 0;
}
