# Maintainer: dvdkon <dvd dot kon at gmail dir com>

pkgname="pce"
pkgver="20140222_4b05f0c"
pkgrel=2
license=('GPL2')
url="http://www.hampa.ch/pce/"
pkgdesc="A PC emulator with support for many machines"
depends=("sdl" "readline")
arch=("i686", "x86_64")
source=("http://www.hampa.ch/pub/pce/pre/$pkgname-20140222-4b05f0c.tar.gz")
sha512sums=("a56c62a1b5850ebf07604e1137b97aefca62971bdee8350811f0d63ed69569b2fde35705dbb1ae6f5aa4bc48d03020a361629d90287a0d911322034acb48c1dd")

build()
{
	cd $pkgname-20140222-4b05f0c
	
	./configure --prefix=/usr
	make
}

package()
{
	cd $pkgname-20140222-4b05f0c
	make DESTDIR="$pkgdir" install
	cd $pkgdir
	mv ./usr/etc ./usr/share/doc
}

