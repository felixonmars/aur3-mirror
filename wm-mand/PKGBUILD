##
# Maintainer: Akshay Srinivasan <akshaysrinivasan@gmail.com>

pkgname=wm-mand
pkgver=1.3.2
pkgrel=1
pkgdesc="Mandelbrot set explorer"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wmmand"
depends=()
license=('GPL')
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=(http://downloads.sourceforge.net/project/wmmand/wmMand/wmMand-1.3.2/wmMand-$pkgver.tar.bz2 )
md5sums=('66eb4a416d52024317d1ea7237c234e4')

build() {
	cd $srcdir/wmMand-$pkgver
	make || return 1
	mkdir -p $pkgdir/usr/bin/ || return 1
	mkdir -p $pkgdir/usr/man/man6/ || return 1
	mkdir -p $pkgdir/usr/share/pixmaps/ || return 1
	make DESTDIR=$pkgdir/usr install || return 1
}
