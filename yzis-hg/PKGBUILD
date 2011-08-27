# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=yzis-hg
pkgver=4266
pkgrel=1
pkgdesc='Vi-like editor with frontends for Qt4 and NCurses'
url='http://www.yzis.org'
license=('GPL')
depends=('qt>=4.1.0' 'lua>=5.1' 'ncurses')
makedepends=('mercurial' 'cmake' 'doxygen')
arch=('i686' 'x86_64')
source=()
md5sums=()
provides=(yzis)
conflicts=(yzis)

_hgroot=('http://sources.freehackers.org/hg.cgi/')
_hgrepo=('Yzis/')

build() {
	cd ${startdir}/src/Yzis

	msg 'Starting make...'
	mkdir build
	cd build
	cmake -DENABLE_LIBYZISRUNNER=off -DCMAKE_VERBOSE_MAKEFILE=on -DGENERATE_DOC=on \
		-DCMAKE_INSTALL_PREFIX=${startdir}/pkg/usr ..
	make || return $?
	make test || return $?
	make install || return $?
}
