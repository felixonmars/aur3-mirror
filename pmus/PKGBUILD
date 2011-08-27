# Contributor: Kim Tore Jensen <kimtjen.at.gmail.dot.com>

pkgname=pmus
pkgver=0.42
pkgrel=1
pkgdesc="Practical Music Search is a highly configurable ncurses-based MPD client written in C++."
url="http://pms.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses' 'glib2')
source=(http://downloads.sourceforge.net/pms/pms-$pkgver.tar.bz2)
md5sums=('8ebd65c5e6e33cd0ca79817a5e823805');

_realname=pms

build() {

	cd ${srcdir}/${_realname}-${pkgver}

	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1

	rm -rf ${srcdir}
}
