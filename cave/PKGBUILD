# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=cave
pkgver=1.0b
pkgrel=2
pkgdesc="An acronym for Character Animation Viewer for Everyone. It uses a curses interface to play ascii character animations."
arch=('i686' 'x86_64')
url="http://bjk.sourceforge.net/cave/"
depends=('ncurses' 'zlib')
#makedepends=('' '')
license=('GPL')
source=(http://downloads.sourceforge.net/bjk/cave-1.0b.tar.gz)
md5sums=('3e7ef9873c82992f055282e31bf7b2d8')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install 
}

