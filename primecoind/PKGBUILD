# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=primecoind
_gitname=primecoin
pkgver=0.1.2
pkgrel=0
pkgdesc="Cryptocurrency with Scientific Computing Proof-of-Work (Prime) - daemon"
arch=('x86_64' 'i686')
url="http://www.primecoin.org/"
license=('MIT')
provides=('primecoind')
conflicts=('primecoin-qt')
depends=('miniupnpc' 'boost-libs' 'openssl')
makedepends=('boost' 'gcc' 'make')
source=("http://downloads.sourceforge.net/project/${_gitname}/${pkgver}/${_gitname}-${pkgver}-linux.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fprimecoin%2Ffiles%2F&ts=1386124079")
sha256sums=('d0f3c6a91b4d505f25e9284bcca85e420cf09d0e6cf71e5a001b7e1367ef46d0') 

## files & commands for building
_makefile_unix=makefile.unix

build() {
	cd ${_gitname}-${pkgver}-linux/src/src
	make USE_UPNP=1 USE_SSL=1 $MAKEFLAGS -f ${_makefile_unix} primecoind
}

package() {
	cd ${_gitname}-${pkgver}-linux/src
	install -Dm755 src/primecoind "$pkgdir"/usr/bin/primecoind
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

