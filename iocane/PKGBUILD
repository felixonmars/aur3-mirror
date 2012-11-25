# Maintainer: Jesse McClure AKA "Trilby" <jmcclure [at] cns [dot] umass [dot] edu>
pkgname=iocane
pkgver=0.2
pkgrel=1
pkgdesc="Simulate X11 mouse events from keyboard"
url="http://github.com/TrilbyWhite/Iocane.git"
arch=('any')
license=('GPLv3')
depends=('libx11')
source=('https://github.com/TrilbyWhite/Iocane/raw/master/'$pkgname-$pkgver'.tar.gz')
md5sums=('e55d2e0b6825b036319f2b1e1185faee')

build() {
    cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	make PREFIX=/usr DESTDIR=$pkgdir install
}

