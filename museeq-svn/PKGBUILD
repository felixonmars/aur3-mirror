# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=museeq-svn
pkgver=1209
pkgrel=6
pkgdesc="A Qt4 interface to the museekd daemon."
url="http://www.museek-plus.org/"
depends=('qt4' 'libevent')
makedepends=('subversion' 'cmake')
license='GPL'
arch=('i686' 'x86_64')
conflicts=('museeq' 'museekplus-svn' 'museek-plus')
provides=('museeq')
source=("${pkgname}::svn+http://www.museek-plus.org/svn/museek+/trunk/sources")
md5sums=('SKIP')

pkgver() {
    cd $SRCDEST/${pkgname}
    svnversion | tr -d [A-z]
}

build() {
    mkdir -p ${srcdir}/${pkgname}/build
    cd ${srcdir}/${pkgname}/build

	cmake -DNO_MUSEEKD=1 -DNO_MUSCAN=1 -DNO_SETUP=1 -DNO_PYMUCIPHER=1 \
        -DPREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 ${srcdir}/${pkgname}
	make
}

package() {
    cd ${srcdir}/${pkgname}/build

	make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
