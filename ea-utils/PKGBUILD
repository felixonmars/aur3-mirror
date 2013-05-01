# Maintainer: Cory Giles <cory.b.giles@gmail.com>

pkgname=ea-utils
pkgver=1.1.2.537
_pkgver=1.1.2-537
pkgrel=1
pkgdesc="Command-line tools for processing biological sequencing data. Barcode demultiplexing, adapter trimming, etc."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ea-utils/"
license=('MIT')
depends=('gsl')
optdepends=('bamtools')
source=('http://ea-utils.googlecode.com/files/ea-utils.'$_pkgver'.tar.gz')
md5sums=('b8d3bcc39edc7fe66d00ed54d9e59830')

build() {
	cd "$srcdir/$pkgname"."$_pkgver"
    unset CFLAGS
	make
}

package() {
	cd "$srcdir/$pkgname"."$_pkgver"
	make PREFIX="$pkgdir/usr" install
    install -m755 -t $pkgdir/usr/bin varcall sam-stats
}
