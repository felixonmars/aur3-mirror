# tenfivecoind Arch PKGBUILD
# Maintainer mxtm <max@mxtm.me>
# Based off of the dogecoin-qt-git PKGBUILD, based off of primecoin-qt's PKGBUILD by Daniel Spies

pkgname=tenfivecoind
_binname=tenfivecoin
pkgver=0.9.0.0
pkgrel=1
pkgdesc="Daemon for TenFiveCoin."
arch=('x86_64' 'i686')
url="http://tenfivecoin.com/"
license=('MIT')
provides=('tenfivecoind')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('http://mxtm.me/dl/tenfivecoin-'${pkgver}'.tar.gz')
install=tenfivecoind.install

sha256sums=('ac2a5921e9e195ce56546b4335605424a00b58078f9918a12ba3954bbdee1da9')

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
