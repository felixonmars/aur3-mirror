#!/usr/bin/bash

for f in testall.c testbits.c testcgi.c testcomp.c testconv.c testcryp.c testdate.c testdes.c testdir.c testexdr.c testfind.c testfort.c testmem.c testmime.c teststr.c testsym.c testtree.c testtron.c testuid.c testxml.c
do
	output=${f%%.c}
	gcc -o $output $f -lsfl -I/usr/include/sfl
	./$output
done
