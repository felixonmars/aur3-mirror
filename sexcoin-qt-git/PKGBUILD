# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer gee
#Based of primecoin-qt by Daniel Spies

pkgname=sexcoin-qt-git
_gitname=sexcoin
_binname=sexcoin
pkgver=0.8.5.45.g6b3776c
pkgrel=1
epoch=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://www.sexcoin.info/"
license=('MIT')
provides=('sexcoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make')
source=('git+https://github.com/sexcoin-project/sexcoin.git'
        'sexcoin.desktop')
install=sexcoin.install

sha256sums=(SKIP
            'fecfc6439049d832127c63f9ddf87c646bed7af07eeb2f70945fea9ab219450e')

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
	sed -i "s|LIBS += -lboost_system-mt -lboost_filesystem-mt -lboost_program_options-mt -lboost_thread-mt|LIBS += -lboost_system -lboost_filesystem -lboost_program_options -lboost_thread |" ./sexcoin-qt.pro.unix
	
	${_qmake} ${_binname}-qt.pro.unix
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_gitname}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
