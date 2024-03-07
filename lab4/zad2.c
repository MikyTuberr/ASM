#include <stdio.h>

unsigned int check_system_dir(char* directory);

int main()
{
	char* directory[] = { "C:\\WINDOWS\\system32" };

	if(check_system_dir(directory) == 1)
	printf("true");
	return 0;
}
