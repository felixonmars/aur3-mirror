#Maintainer shapeshifter499

_pkgname=dogecoindark-core
pkgname=$_pkgname-git
_gitname=dogedsource
_binname=dogecoindark
pkgver=1
pkgrel=1
epoch=1
pkgdesc="DogeCoinDark is a new coin, that already fulfills the original ideals of crypto-currency: Decentralization, Anonymity, and just plain doge fun!  Daemon and CLI version"
arch=('x86_64' 'i686')
url="http://dogecoindark.net/"
license=('MIT')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
provides=('dogecoindarkd' 'dogecoindark-cli')
install=$pkgname.install
sha256sums=('ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c' 'SKIP')

source=("$pkgname.install" "git+https://github.com/doged/dogedsource.git")

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
