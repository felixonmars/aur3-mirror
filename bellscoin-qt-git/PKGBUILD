# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer gee
#Based of primecoin-qt by Daniel Spies

pkgname=bellscoin-qt-git
_gitname=bellscoin
_binname=bellscoin
pkgver=0.8.5.45.g6b3776c
pkgrel=1
epoch=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="https://bitcointalk.org/index.php?topic=349695.0"
license=('MIT')
provides=('bellscoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make')
source=('git+https://github.com/bellscoin/bellscoin.git'
        'bellscoin.desktop')
install=bellscoin.install

sha256sums=(SKIP
            '5f0b1ef82b0c2782e5b51cfe34ee0ee0011b11dacf853091ccb3d3ab3a109adb')

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe | sed "s/^v//; s/-/./g"
}
    

build() {
	#cd ${_gitname}/src
	cd ${_gitname}
	
	#sed -i "s|LIBS.*mgw.*|LIBS += -lboost_system -lboost_filesystem -lboost_program_options -lboost_thread|" ./dogecoin-qt.pro
	#sed -i "s|BOOST_LIB_SUFFIX=.*|BOOST_LIB_SUFFIX=|" ./dogecoin-qt.pro
	#sed -i "s|macx:BOOST_LIB_SUFFIX.*||" ./dogecoin-qt.pro
	#sed -i "s|windows:BOOST_LIB_SUFFIX.*||" ./dogecoin-qt.pro
	
	${_qmake} bells-qt.pro
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_gitname}
	install -Dm755 bells-qt "$pkgdir"/usr/bin/bellscoin-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
