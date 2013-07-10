/*
wagnumerals V2

save as wagnumerals.c
compile:
gcc -std=c99 -o wagnumerals wagnumerals.c

usage:
wagnumerals WAGNUMERAL

WAGNUMERAL can be an unsorted uppercase and/or lowercase mix of the seven
Roman numerals (I, V, X, L, C, D, M).

Uppercase add to the total and lowercase subtract from the total. Thus
positive and negative numbers can be produced (and zero).
*/

#include <ctype.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void usage()
{
	printf("Usage: wagnumerals WAGNUMERAL\n");
	exit(1);
}

int main(int argc, char **argv)
{
	if (argc != 2)
		usage();
	long long total = 0;
	int d;
	char c;
	for (int i = 0; i < strlen(argv[1]); i++)
	{
		c = toupper(argv[1][i]);
		if (c == 'I')
			d = 1;
		else if (c == 'V')
			d = 5;
		else if (c == 'X')
			d = 10;
		else if (c == 'L')
			d = 50;
		else if (c == 'C')
			d = 100;
		else if (c == 'D')
			d = 500;
		else if (c == 'M')
			d = 1000;
		else
			usage();
		if (argv[1][i] == c)
			total += d;
		else
			total -= d;
	}
	printf("%"PRId64"\n", total);
	return 0;
}
