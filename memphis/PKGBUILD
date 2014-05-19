# Maintainer:  perlawk
pkgname=memphis  
pkgver=1.9
pkgrel=2 
pkgdesc="A C/C++ extension for compiler writers."
url="http://memphis.compilertools.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc')
options=('staticlibs')
install=
source=(http://memphis.compilertools.net/$pkgname-$pkgver.tar.gz)
md5sums=('cbf5b4ac51ff296a25c2a82a0d477213')

prepare() {
  cd $srcdir/$pkgname-$pkgver/memphis
	sed -i '1i#include <stdio.h>\n#include <string.h>\n#include <stdlib.h>\n' *.c ../examples/inter/err.c
	sed -i 's/MatchError(char/MatchError(const char/' cpp.c ../mrts/mrts.cpp
}

build() {
	cd $srcdir/$pkgname-$pkgver/memphis
	./build 
	cd ../mrts
	g++ -fpic -c mrts.cpp 	
	g++ -shared -o libmemphis.so mrts.o
	ar cr libmemphis.a mrts.o
}

package() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	cp memphis/memphis $pkgdir/usr/bin
	cp mrts/libmemphis* $pkgdir/usr/lib
}
