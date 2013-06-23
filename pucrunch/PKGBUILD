# Maintainer: Your Name <youremail@domain.com>

pkgname=pucrunch
pkgver=22.11.2008
pkgrel=1
pkgdesc="An Optimizing Hybrid LZ77 RLE Data Compression Program"
arch=('i686' 'x86_64')
url="http://www.cs.tut.fi/~albert/Dev/pucrunch/"
license=('unknown')
source=(http://www.cs.tut.fi/~albert/Dev/pucrunch/pucrunch.c
	http://www.cs.tut.fi/~albert/Dev/pucrunch/pucrunch.h
	http://www.cs.tut.fi/~albert/Dev/pucrunch/Makefile)
md5sums=('a43ab21ebfe466a294e2f2ac5c41a000'
	'c7c675385345d981e0b3df16cbfa93d0'
	'8e669a0aa3832ff9305735dcf108f4a3')

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 pucrunch "$pkgdir/usr/bin" 
}
