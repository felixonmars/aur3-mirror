# Contributor: Juan Diego Tascon

pkgname=producer
pkgver=1.1.1
pkgrel=1
pkgdesc="Cross platform library focused on camera control"
arch=('i686' 'x86_64')
url="http://www.andesengineering.com/Producer"
license=('GPL')
makedepends=('glut')
source=("http://www.andesengineering.com/Producer/Download/Releases/Producer-1.1-1.tar.gz")
md5sums=('074e9fa67d3de8460e459453eac557c1')

build() {
	# configure
	cd ${startdir}/src/Producer-1.1-1

	for f in src/*.cpp
	do
		( echo "#include <stdlib.h>"; echo "#include <string.h>"; cat $f ) >> $f.tmp
		mv -f $f.tmp $f
	done

	make

	mkdir -p ${startdir}/pkg/usr/

	make INST_LOCATION=${startdir}/pkg/usr/ install
}

