#include <stdio.h>
int dzielenie(int *dzielna, int ** dzielnik);
int main()
{
	int x, y, wynik;

	x = 10100;
	y = -5;
	int *wsk = &y;

	wynik = dzielenie(&x, &wsk);

	printf("%d", wynik);
	return 0;
}
