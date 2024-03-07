#include <stdio.h>

void przestaw(int tabl[], int n);

int main()
{
	int tab[10] = { 9, 20, 8, 0, -1, 0, -2, 19, 21, 1 };

	for (int i = 0; i < (sizeof(tab)/sizeof(int)) - 1; i++) {
		przestaw(tab, 10 - i);
	}

	for (int i = 0; i < sizeof(tab)/sizeof(int); i++) {
		printf("%d ", tab[i]);
	}

	return 0;
}