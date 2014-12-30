# Author: Jim Ferguson <ferguson@ncsa.uiuc.edu>
# Contributor: Xi0N <jonandermonleon@gmail.com>
# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=iperf3
pkgver=3.0.10
pkgrel=1
pkgdesc="iperf3 is a new implementation from scratch, with the goal of a smaller, simpler code base, and a library version of the functionality that can be used in other programs"
arch=(any)
url="https://github.com/esnet/iperf" 
license=(BSD)
depends=() 
source=(https://github.com/esnet/iperf/archive/$pkgver.tar.gz)
sha1sums=('5340c08fcb72f1302a111fc635d42dcfff68ca0a')

build() { 
	cd "$srcdir/iperf-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/iperf-$pkgver"
        make DESTDIR="$pkgdir/" install
}

