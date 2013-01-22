# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Anntoin Wilkinson <anntoin@gmail.com>

pkgname=fsv
pkgver=0.9
pkgrel=5
pkgdesc="3D File System Visualizer"
arch=('i686' 'x86_64')
url="http://fsv.sourceforge.net/"
license=('GPL')
depends=('gtkglarea1' 'glu')
optdepends=('lynx: help browser')
source=("http://downloads.sourceforge.net/sourceforge/fsv/${pkgname}-${pkgver}.tar.gz")
md5sums=('0f68e27d638c45dbdf4f66fa19f811f0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
