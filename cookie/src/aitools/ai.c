#include <stdio.h>
#include "aitools.h"

int main()
{
	ga_init();

	date_new("every thursday i do stats class");

	pa_init();
	pa_rem_get();

	return 0;
}
