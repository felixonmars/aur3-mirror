#!/bin/bash
## This will create symbolic links for every file in directory.
## I do this to go around later anoyances since it is possible that 
## sometimes makefile will look for gcc under diffirent name.
## Other possible solution is to EXPORT diffirent naming in PKGBUILD,
## but this seems easier and more robust.

## This is how crosstool's binaries are named
slave="arm-linux-gnueabihf-"
## However, most of makefiles will expect this:
host="armv6l-unknown-linux-gnueabihf-"

for file in $slave*; do
	ln -s "$file" ${file/$slave/$host}
	ln -s "$file" ${file#$slave}
done

## One more thing...
ln -s $slave-gcc cc