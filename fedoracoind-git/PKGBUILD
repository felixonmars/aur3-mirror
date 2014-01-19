# fedoracoind-git Arch PKGBUILD
# Maintainer mxtm <max@mxtm.me>
# Based off of the dogecoin-qt-git PKGBUILD, based off of primecoin-qt's PKGBUILD by Daniel Spies

pkgname=fedoracoind-git
_gitname=fedoracoin
_binname=fedoracoin
pkgver=0.43.da59a37
pkgrel=2
pkgdesc="Daemon for FedoraCoin, git version."
arch=('x86_64' 'i686')
url="https://bitcointalk.org/index.php?topic=380466.0"
license=('MIT')
provides=('fedoracoind')
conflicts=('fedoracoind')
depends=('miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('git+https://github.com/fedoracoin/fedoracoin.git')
install=fedoracoind-git.install

sha256sums=(SKIP)

## files & commands for building
pkgver() {
	cd ${_gitname}
	echo $(git describe --always | sed 's/-/./g')
}
    

build() {
	cd ${_gitname}/src

	make -f makefile.unix ${MAKEFLAGS}
}

package() {
	cd ${_gitname}/src
	install -Dm755 ${_binname}d "$pkgdir"/usr/bin/${_binname}d
	install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
