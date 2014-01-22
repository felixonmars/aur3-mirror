# unobtanium-qt Arch PKGBUILD
# Maintainer mxtm <max@mxtm.me>
# Based off of the dogecoin-qt-git PKGBUILD, based off of primecoin-qt's PKGBUILD by Daniel Spies

pkgname=unobtanium-qt
_binname=unobtanium
_altname=Unobtanium
pkgver=0.9.2.9
pkgrel=1
pkgdesc="A QT wallet for the Unobtanium cryptocurrency."
arch=('x86_64' 'i686')
url="http://unobtanium.io/"
license=('MIT')
provides=('unobtanium-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('http://unobtanium.io/files/Unobtanium-0.9.2.9.tar.gz'
        'unobtanium.desktop')
install=unobtanium-qt.install

sha256sums=('9de8fd8a2c36541033e5a21d4b056c99d7e4bb3913fe81c1bbc44f1aca4cfc35'
            '69a7413324e9f9d23b7f6d5ae4a2c2ce0d39584a1017208fdaf525527d30091f')

## files & commands for building
_qmake=qmake-qt4

build() {
	tar -xvzf ${_altname}-${pkgver}.tar.gz

	cd ${_altname}-${pkgver}

	${_qmake}
		
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_altname}-${pkgver}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
