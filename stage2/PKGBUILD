# Maintainer: numeral <numerical@gmail.com>
pkgname=stage2
pkgver=2.1.1
pkgrel=2
pkgdesc="2.1.x branch of the Stage Robotic Simulator"
arch=(any)
url="http://playerstage.sf.net"
license=('GPL')
provides=(stage)
source=(http://sourceforge.net/projects/playerstage/files/Stage/${pkgver}/stage-${pkgver}.tar.bz2 )
md5sums=('SKIP') #generate with 'makepkg -g'

build() {
	cd "$srcdir/stage-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/stage-$pkgver"
	make DESTDIR="$pkgdir/" install
}
