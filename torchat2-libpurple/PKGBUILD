# Maintainer: Techmeology <techmeology@techmeology.co.uk>
pkgname=torchat2-libpurple
pkgver=git
pkgrel=1
pkgdesc="Libpurple plugin for Torchat v2"
arch=('any')
url="https://github.com/prof7bit/TorChat"
license=('unknown')
depends=('libpurple')
makedepends=('fpc')
source=(torchat2::git+https://github.com/prof7bit/TorChat.git)
md5sums=('SKIP')

build() {
	cd "$srcdir/torchat2"
	make purple
}

package() {
	cd "$srcdir/torchat2"
	make PREFIX="$pkgdir/usr/" installpurple
}
