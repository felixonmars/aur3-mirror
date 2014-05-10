# Maintainer: perlawk

pkgname=gentle
pkgver=97
pkgrel=1 
pkgdesc="GENTLE 97 campus edition, a compiler construction system"
url="http://gentle.compilertools.net/"
arch=('x86_64' 'i686')
license=('custom')
options=('staticlibs')
source=( "http://gentle.compilertools.net/gentle-97.tar.gz")

prepare() {
	cd "$srcdir"/"$pkgname-$pkgver"
	find . -name "*.c" -exec sed -i '1i#include <stdio.h>\n#include<stdlib.h>\n#include<string.h>\n' {} \; 
}

build() {
	cd "$srcdir"/"$pkgname-$pkgver"
	cd gentle; ./build
	cd ../lib; ./build
	ar rcs libgentle.a *.o
	cd ../reflex; ./build
}

package() {
	cd "$srcdir"/"$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	cp gentle/gentle "$pkgdir/usr/bin"
	cp reflex/reflex "$pkgdir/usr/bin"
	cp lib/libgentle.a "$pkgdir/usr/lib"
}
md5sums=('dc3bfb2c6d90b566550c300ae77794f7')
