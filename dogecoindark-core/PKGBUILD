#Maintainer shapeshifter499

pkgname=dogecoindark-core
_gitname=dogedsource
_binname=dogecoindark
pkgver=v1.git
pkgrel=1
pkgdesc="DogeCoinDark is a new coin, that already fulfills the original ideals of crypto-currency: Decentralization, Anonymity, and just plain doge fun!  Daemon and CLI version"
arch=('x86_64' 'i686')
url="http://dogecoindark.net/"
license=('MIT')
provides=('dogecoindarkd' 'dogecoindark-cli')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('git+https://github.com/doged/dogedsource.git')
install=dogecoindark.install

sha256sums=(SKIP)

## files & commands for building
_qmake=qmake-qt4
    

build() {
	cd ${_gitname}/src
	
	make -f makefile.unix
}

package() {
	cd ${_gitname}
	install -Dm755 src/${_binname}d "$pkgdir"/usr/bin/${_binname}-cli
	install -Dm755 src/${_binname}d "$pkgdir"/usr/bin/${_binname}d
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
