# Maintainer: kokakoda <kokakoda [at] gmail [dot] com>
pkgname=hinversi
pkgver=0.8.2
pkgrel=1
pkgdesc="An implementation of Reversi (Othello)."
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://sourceforge.net/projects/hinversi"
license=('GPL')
source=("http://downloads.sourceforge.net/project/hinversi/latest/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('8a2240b84863aaa130a4128035afe484')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
