#!/bin/bash
# pullandmake 0.1

echo "::pullandmake:: Trying to pull package $1"
wget -O $1.tar.gz http://aur.archlinux.org/packages/$1/$1.tar.gz && {
    [[ -d $1 ]] && {
	echo "::pullandmake:: Directory $1/ exists, removing it"
	rm -r $1
    }
    echo "::pullandmake:: Extracting $1.tar.gz"
    tar -xvzf $1.tar.gz
    echo "::pullandmake:: Entering directory $1/"
    cd $1
    echo "::pullandmake:: Starting to make the package $1"	
    makepkg -s
} || echo "::pullandmake:: A problem occured. See output above."	     
