pkgname=charcount
pkgver=0.2
pkgrel=1
pkgdesc="Simple CLI utility to count the number of characters in a string."
arch=('i686' 'x86_64')
url="http://terra-byte.org/"
license=('GPL3')
source=('http://terra-byte.org/sites/default/files/projects/charcount/charcount-0.2.tar.bz2')
md5sums=('ffaa2ba0e16eeca2d47a4b108c4b08b2')

build() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin/
	g++ $CXXFLAGS -o $pkgdir/usr/bin/$pkgname charcount.cpp
}
