# Maintainer: Marat "Morion" Talipov <morion.self@gmail.com>

pkgname=qutim-stable
pkgver=0.3.2
pkgrel=1
pkgdesc="Multiprotocol instant messenger, based on Qt. Stable version"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('LGPL, GPLv3')
depends=('qt4' 'qtwebkit' 'openssl' 'libxss' 'gnutls' 'zlib' 'qca-ossl' 'qca' 'cyrus-sasl' 'attica' 'sdl' 'sdl_mixer' 'aspell')
makedepends=('gcc' 'make' 'cmake' 'jreen' 'pkgconfig' 'libpurple')
conflicts=('qutim-0.2_ru-git' 'qutim-0.3-git' 'qutim-git' 'qutim-meta-git' 'qutim-0.2.80.00-meta-git')
source=('http://qutim.org/dwnl/68/qutim-0.3.2.tar.xz')
md5sums=('89b6c48d2b1cdb125c8df6f547eaa5fd')

_cmakekeys="-DCMAKE_BUILD_TYPE=Release
            -DQRCICONS=0
            -DQMLCHAT:BOOL=0
            -DKINETICPOPUPS:BOOL=0
            -DASTRAL:BOOL=0
            -DPLUGMAN:BOOL=0
            -DSCRIPTAPI:BOOL=0
            -DSTACKEDCHATFORM:BOOL=0
            -DMOBILEABOUT:BOOL=0
            -DKINETICSCROLLER:BOOL=0
            -DWEBKITSTYLE/MAEMO:BOOL=0
            -DMOBILECONTACTINFO:BOOL=0
            -DMOBILESETTINGSDIALOG:BOOL=0
            -DDECLARATIVE_UI:BOOL=0
            -DSYMBIANINTEGRATION:BOOL=0
            -DMACINTEGRATION:BOOL=0
            -DMAEMO5INTEGRATION:BOOL=0
            -DMEEGOINTEGRATION:BOOL=0
            -DMULTIMEDIABACKEND:BOOL=0
            -DANTIBOSS:BOOL=0
            -DWININTEGRATION:BOOL=0
            -DVIDROBACKEND:BOOL=0
	    -DSYSTEM_JREEN:BOOL=1
            -DCMAKE_INSTALL_PREFIX=/usr
	    -DQT_QMAKE_EXECUTABLE=qmake-qt4"
 
build() {
	unset LDFLAGS; LDFLAGS="-Wl,--hash-style=gnu"
	cd "$srcdir/qutim-$pkgver"
	[ -d build ] || mkdir build
	msg "Building ..."
  	cd ${srcdir}/qutim-${pkgver}/build
	cmake $_cmakekeys .. || return 1
	make || return 1
}

package() {
	cd ${srcdir}/qutim-${pkgver}/build
    	make DESTDIR=${pkgdir} install || return 1
	msg "Done"
}
