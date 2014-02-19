# thepandacoind Arch PKGBUILD
# Maintainer mxtm <max@mxtm.me>
# Based off of the dogecoin-qt-git PKGBUILD, based off of primecoin-qt's PKGBUILD by Daniel Spies

pkgname=thepandacoind
_binname=thepandacoin
pkgver=0.8.6.2
pkgrel=1
pkgdesc="Daemon for The Panda Coin."
arch=('x86_64' 'i686')
url="http://thepandacoin.com/"
license=('MIT')
provides=('thepandacoind')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('http://mxtm.me/dl/thepandacoin-'${pkgver}'.tar.gz')
install=thepandacoind.install

sha256sums=('b57cd9eb36e80f7ab7c1ee6f864e2951ba5547bec7dcb484eb10445effbb85eb')

# files & commands for building
build() {
	tar -xvzf ${_binname}-${pkgver}.tar.gz

	cd ${_binname}-${pkgver}/src

	make -f makefile.unix ${MAKEFLAGS}
}

package() {
	cd ${_binname}-${pkgver}/src
	install -Dm755 ${_binname}d "$pkgdir"/usr/bin/${_binname}d
	install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
