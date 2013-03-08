# Contributor: wodim <neikokz@gmail.com>

pkgname=pngdefry
pkgver=1.1
pkgrel=1
pkgdesc="Repairs fried PNG files found inside iPhone/iPad .ipa files"
arch=('i686' 'x86_64')
url="http://www.jongware.com/pngdefry.html"
license="Public domain"
source=('http://www.jongware.com/binaries/pngdefry.zip')
md5sums=('382c31a1afcc79a15ee67e3360588eeb')

build() {
	cd $srcdir/pngdefry/source/
	gcc -o pngdefry pngdefry.c
}

package() {
	cd $pkgdir
	mkdir usr/bin -p
	cp $srcdir/pngdefry/source/pngdefry usr/bin
}