# Maintainer: Lazaros Koromilas <lostd@2f30.org>
pkgname=noice
pkgver=0.2
pkgrel=1
pkgdesc="Small file browser"
arch=('i686' 'x86_64' 'armv6h')
url="http://git.2f30.org/noice/"
license=('BSD')
depends=('ncurses')
source=(http://dl.2f30.org/releases/$pkgname-$pkgver.tar.gz)
        
md5sums=('c1eeaf040beb7963999936e4b81d3755')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
