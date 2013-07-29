# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
pkgname=ferrisloki
pkgver=3.0.13
pkgrel=1
pkgdesc="Loki library adapted for Linux"
arch=('i686' 'x86_64')
url="http://www.libferris.com/"
license=('GPL2')
depends=('libsigc++')
source=("http://sourceforge.net/projects/witme/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('9edcd72bd18446e305b57c95193dd0ed')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
