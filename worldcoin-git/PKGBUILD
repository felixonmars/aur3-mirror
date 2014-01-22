pkgname=worldcoin-git
_gitname=Worldcoin
pkgver=bff08fa
pkgrel=1
pkgdesc="WorldCoin is designed to be the digital currency of the future."
arch=('x86_64' 'i686')
url="http://worldcoinfoundation.org/"
license=('MIT')
provides=('worldcoin-qt')
conflicts=('worldcoin-qt' 'worldcoind-git')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('git' 'boost' 'gcc' 'make')
source=('git://github.com/worldcoinproject/Worldcoin'
        'worldcoin.desktop')
install=worldcoin.install
sha256sums=(SKIP 
            'a6d31ea188486694e2571715eca93b6050e2b87ec7542f24cf645f118743d7e3')

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

pkgver() {
	cd ${_gitname}
	git describe --always | sed 's|-|.|g'
}

build() {
	cd ${_gitname}/src

	# build Worldcoin-qt
	msg "Building WorldCoin QT GUI"
	cd ..
	${_qmake}
	make $MAKEFLAGS
}

package() {
	install -Dm644 worldcoin.desktop ${pkgdir}/usr/share/applications/worldcoin.desktop

	cd ${_gitname}
	install -Dm755 worldcoin-qt ${pkgdir}/usr/bin/worldcoin-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png ${pkgdir}/usr/share/pixmaps/worldcoin.png
}

