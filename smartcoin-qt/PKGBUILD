#Maintainer zezadas
#I used dogecoin-qt as base for this one
#I Used the packet "dogecoin-qt-git" of Gee as a base for this one
#Based of primecoin-qt by Daniel Spies
#help me geting smarter. :)
#SfVGFomEGPWeEg18JJzA6B67TuZSuUzjYt


pkgname=smartcoin-qt
_binname=Smartcoin
pkgver=1.0.0.0
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http:/http://getsmartcoin.com//"
license=('MIT')
provides=('smartcoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('Smartcoin.desktop')
install=smartcoin.install

sha256sums=('0ff09898c080ab01449b8c5363e58696b5e3ebe8dbd8d6fd2a36198884070e6e')

## files & commands for building
_qmake=qmake-qt4

build() {
	git clone https://github.com/smartcoin-project/smartcoin.git
	cd ${srcdir}/smartcoin/
	
	${_qmake} smartcoin-qt.pro
		
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd $srcdir/smartcoin
	install -Dm755 ${_binname}-qt "${pkgdir}/usr/bin/${_binname}-qt"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "${pkgdir}/usr/share/pixmaps/${_binname}.png"
}
