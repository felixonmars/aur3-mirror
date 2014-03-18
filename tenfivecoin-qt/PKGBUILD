# tenfivecoin-qt Arch PKGBUILD
# Maintainer mxtm <max@mxtm.me>
# Based off of the dogecoin-qt-git PKGBUILD, based off of primecoin-qt's PKGBUILD by Daniel Spies

pkgname=tenfivecoin-qt
_binname=tenfivecoin
pkgver=0.9.0.0
pkgrel=1
pkgdesc="A QT wallet for the cryptocurrency TenFiveCoin."
arch=('x86_64' 'i686')
url="http://tenfivecoin.com/"
license=('MIT')
provides=('tenfivecoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('http://mxtm.me/dl/tenfivecoin-'${pkgver}'.tar.gz'
        'tenfivecoin.desktop')
install=tenfivecoin-qt.install

sha256sums=('ac2a5921e9e195ce56546b4335605424a00b58078f9918a12ba3954bbdee1da9'
            'e73ba05234807db64812e7ec8607cd84649d18e09078304f7e57de6304d486e1')

## files & commands for building
_qmake=qmake-qt4

build() {
	tar -xvzf ${_binname}-${pkgver}.tar.gz

	cd ${_binname}-${pkgver}

	${_qmake}
		
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_binname}-${pkgver}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
