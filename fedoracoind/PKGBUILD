# fedoracoind Arch PKGBUILD
# Maintainer mxtm <max@mxtm.me>
# Based off of the dogecoin-qt-git PKGBUILD, based off of primecoin-qt's PKGBUILD by Daniel Spies

pkgname=fedoracoind
_binname=fedoracoin
pkgver=1.0
pkgrel=1
pkgdesc="Daemon for FedoraCoin."
arch=('x86_64' 'i686')
url="http://fedoraco.in"
license=('MIT')
provides=('fedoracoind')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('http://files.fedoraco.in/'${pkgver}'/fedoracoin-'${pkgver}'.tar.gz')
install=fedoracoind.install

sha256sums=('5e02afdc5a691cedd97a367224936cdbc029ddbc326841a30868c2a5923f58fb')

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
