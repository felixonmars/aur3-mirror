# Maintainer: Cory Giles
pkgname=quip
pkgver=1.1.6
pkgrel=2
pkgdesc="Compressing next-generation sequencing data in the FASTQ and SAM/BAM formats with extreme prejudice."
arch=('i686' 'x86_64')
url="http://homes.cs.washington.edu/~dcjones/quip/"
license=('BSD')
source=(http://homes.cs.washington.edu/~dcjones/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1636a90c2495c276801ab5ec8c9278da')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
