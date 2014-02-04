#Maintainer zezadas
#I used dogecoin-qt as base for this one
#I Used the packet "dogecoin-qt-git" of Gee as a base for this one
#Based of primecoin-qt by Daniel Spies

pkgname=potcoin-qt
_binname=potcoin
pkgver=0.8.6.2
pkgrel=2
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://potcoin.info/"
license=('MIT')
provides=('potcoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('potcoin.desktop')
install=potcoin.install

sha256sums=('c4e9146c76f5311e249689aa528aded713121bd3043d4fb521e49d8721a17cfd')

## files & commands for building
_qmake=qmake-qt4

build() {
	git clone https://github.com/potcoin/potcoin.git
	cd ${srcdir}/potcoin/
	
	${_qmake} bitcoin-qt.pro
		
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd $srcdir/potcoin
	install -Dm755 ${_binname}-qt "${pkgdir}/usr/bin/${_binname}-qt"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "${pkgdir}/usr/share/pixmaps/${_binname}.png"
}
