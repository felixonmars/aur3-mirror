# Maintainer: Acho Arnold <arnoldewin@gmail.com>


pkgname=cxref
pkgver=1.6e
pkgrel=1
pkgdesc="A program that can automatically generate documentation and cross references for a C program."
arch=('x86_64' 'i686')
url="http://www.gedanken.demon.co.uk/"
license=('GPL')
source=("http://www.gedanken.org.uk/software/cxref/download/cxref-1.6e.tgz")
md5sums=('f8c85c42515f7276abac940444c6ba77')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}