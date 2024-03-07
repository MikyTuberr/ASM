#include <stdio.h>
#include <xmmintrin.h>

__m128 mul_at_once(__m128 one, __m128 two);

int main(void) {

    __m128 one, two, wynik;
    one.m128_i32[0] = 50;
    one.m128_i32[1] = -10;
    one.m128_i32[2] = 200;
    one.m128_i32[3] = 667;

    two.m128_i32[0] = -2;
    two.m128_i32[1] = -44;
    two.m128_i32[2] = 343;
    two.m128_i32[3] = 6;

	wynik = mul_at_once(one, two);
	printf("%d %d %d %d", wynik.m128_i32[0], wynik.m128_i32[1],
		wynik.m128_i32[2], wynik.m128_i32[3]);

	return 0;
}