# unobtaniumd Arch PKGBUILD
# Maintainer mxtm <max@mxtm.me>
# Based off of the dogecoin-qt-git PKGBUILD, based off of primecoin-qt's PKGBUILD by Daniel Spies

pkgname=unobtaniumd
_binname=unobtanium
_altname=Unobtanium
pkgver=0.9.2.9
pkgrel=1
pkgdesc="Daemon for Unobtanium."
arch=('x86_64' 'i686')
url="http://unobtanium.io/"
license=('MIT')
provides=('unobtaniumd')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('http://unobtanium.io/files/Unobtanium-0.9.2.9.tar.gz')
install=unobtaniumd.install

sha256sums=('9de8fd8a2c36541033e5a21d4b056c99d7e4bb3913fe81c1bbc44f1aca4cfc35')

## files & commands for building
build() {
	tar -xvzf ${_altname}-${pkgver}.tar.gz

	cd ${_altname}-${pkgver}/src

	make -f makefile.unix ${MAKEFLAGS}
}

package() {
	cd ${_altname}-${pkgver}/src
	install -Dm755 ${_binname}d "$pkgdir"/usr/bin/${_binname}d
	install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
