# Maintainer: Radek Podgorny <radek@podgorny.cz>
pkgname=bcm2835
pkgver=1.37
pkgrel=1
epoch=
pkgdesc="C library for Broadcom BCM 2835 as used in Raspberry Pi"
arch=('armv6h')
url="http://www.airspayce.com/mikem/bcm2835/index.html"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=
changelog=
source=(http://www.airspayce.com/mikem/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('2314bcbd2e1c6a164dbeda58abfb9c04')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
