# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=primecoin-git
_gitname=primecoin
pkgver=v0.1.1xpm.1.gab9fe91
pkgrel=2
pkgdesc="Cryptocurrency with Scientific Computing Proof-of-Work (Prime)"
arch=('x86_64' 'i686')
url="http://www.primecoin.org/"
license=('MIT')
provides=('primecoin-qt' 'primecoind')
conflicts=('primecoin-qt' 'primecoind' 'primecoind-git')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('git' 'boost' 'gcc' 'make')
source=('git://github.com/primecoin/primecoin.git'
        'primecoin.desktop')
install=primecoin.install
sha256sums=(SKIP 
            'd48546c4aab0a1f42fad2aa2f2069d20b4ab85782703927ca6a4bd0846d6348f')

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

pkgver() {
	cd ${_gitname}
	git describe --always | sed 's|-|.|g'
}

build() {
	cd ${_gitname}/src

	# build primecoind
	msg "Building PrimeCoin daemon"
	make USE_UPNP=1 USE_SSL=1 $MAKEFLAGS -f ${_makefile_unix} primecoind

	# build primecoin-qt
	msg "Building PrimeCoin QT GUI"
	cd ..
	${_qmake}
	make $MAKEFLAGS
}

package() {
	install -Dm644 primecoin.desktop ${pkgdir}/usr/share/applications/primecoin.desktop

	cd ${_gitname}
	install -Dm755 primecoin-qt ${pkgdir}/usr/bin/primecoin-qt
	install -Dm755 src/primecoind ${pkgdir}/usr/bin/primecoind
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/primecoin.png ${pkgdir}/usr/share/pixmaps/primecoin256.png
}

