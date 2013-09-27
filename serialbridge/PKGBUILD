# Maintainer: Samuel Tardieu <sam@rfc1149.net>
pkgname=serialbridge
pkgver=0.1
pkgrel=1
pkgdesc="Bridge between a serial port and a TCP socket"
arch=('i686', 'x86_64')
url="http://www.rfc1149.net/devel/serialbridge.html"
license=('GPL')
depends=('glibc')
source=(http://www.rfc1149.net/download/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4e100391e8816afc7a79f3843ed521fc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
