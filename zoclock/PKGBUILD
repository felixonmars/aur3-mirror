# Contributor: pktfag

pkgname=zoclock
pkgver=1.2.0
pkgrel=1
pkgdesc="The ZOClock (Zero-One Clock) program emulate two-line LED display to show the time in binary form"
arch=('i686')
url="http://zoclock.googlecode.com/"
license=('GPL-3')
depends=('qt')
source=(http://zoclock.googlecode.com/files/$pkgname-$pkgver.tar.gz)

md5sums=('27f21554492fc2484b6bb303bfbf3019')

build() {
	cd "$srcdir"/$pkgname-$pkgver
	qmake || return 1
	make || return 1
	install -D -m755 $pkgname "$pkgdir"/bin/$pkgname
}
