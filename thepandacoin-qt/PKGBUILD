# thepandacoin-qt Arch PKGBUILD
# Maintainer mxtm <max@mxtm.me>
# Based off of the dogecoin-qt-git PKGBUILD, based off of primecoin-qt's PKGBUILD by Daniel Spies

pkgname=thepandacoin-qt
_binname=thepandacoin
pkgver=0.8.6.2
pkgrel=1
pkgdesc="A QT wallet for the cryptocurrency The Panda Coin."
arch=('x86_64' 'i686')
url="http://thepandacoin.com/"
license=('MIT')
provides=('thepandacoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('http://mxtm.me/dl/thepandacoin-'${pkgver}'.tar.gz'
        'thepandacoin.desktop')
install=thepandacoin-qt.install

sha256sums=('b57cd9eb36e80f7ab7c1ee6f864e2951ba5547bec7dcb484eb10445effbb85eb'
            '88d226dbe8d8da303c7fe9fb35b8a2ed39e0416166b23377de98b9ede8c55173')

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
