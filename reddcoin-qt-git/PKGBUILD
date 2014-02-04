#Maintainer zezadas
#I used dogecoin-qt as base for this one
#I Used the packet "dogecoin-qt-git" of Gee as a base for this one
#Based of primecoin-qt by Daniel Spies
#feel free to donate... ReXcH9k1AMR5RbNEdoLjw5aXAh5tZF3z48

pkgname=reddcoin-qt-git
_binname=reddcoin
pkgver=0.8.6.2
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://www.reddcoin.com/"
license=('MIT')
provides=('reddcoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('reddcoin.desktop')
install=reddcoin.install

sha256sums=('c3fea2a07c8327026b8cb7704b5e1103040215085055679bbbda5139c2de2a13')

## files & commands for building
_qmake=qmake-qt4

build() {
	git clone https://github.com/reddcoin/reddcoin.git
	cd ${srcdir}/reddcoin/
	
	${_qmake} reddcoin-qt.pro
		
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd $srcdir/reddcoin
	install -Dm755 ${_binname}-qt "${pkgdir}/usr/bin/${_binname}-qt"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "${pkgdir}/usr/share/pixmaps/${_binname}.png"
}
