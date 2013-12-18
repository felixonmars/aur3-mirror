# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer gee
#Based of primecoin-qt by Daniel Spies

pkgname=billioncoin-qt-git
_gitname=bil
_binname=billioncoin
pkgver=0.8.5.r45.g6b3776c
pkgrel=2
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="https://bitcointalk.org/index.php?topic=374073.0"
license=('MIT')
provides=('billioncoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make')
source=('git+https://github.com/billioncoin/bil.git'
        'billioncoin.desktop')
install=billioncoin.install

sha256sums=(SKIP
            '14c3a67b25c965b9e8a620dd7cb77537bcbb92067f8a32d5c659047a14756f56')

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
    

build() {
	cd ${_gitname}
	
	sed -i "s|LIBS.*mgw.*|LIBS += -lboost_system -lboost_filesystem -lboost_program_options -lboost_thread|" ./billioncoin-qt.pro
	sed -i "s|BOOST_LIB_SUFFIX=.*|BOOST_LIB_SUFFIX=|" ./billioncoin-qt.pro
	sed -i "s|macx:BOOST_LIB_SUFFIX.*||" ./billioncoin-qt.pro
	sed -i "s|windows:BOOST_LIB_SUFFIX.*||" ./billioncoin-qt.pro
	
	${_qmake} ${_binname}-qt.pro
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_gitname}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
