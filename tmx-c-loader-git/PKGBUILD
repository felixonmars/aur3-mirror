# Maintainer: Kilian KÃ¶ppchen <kiliankoeppchen at gmail dot com>
pkgname=tmx-c-loader-git
provides=('tmx-c-loader')
pkgver=66c4cd1
pkgrel=1
pkgdesc="Loads .tmx tiled maps in your games."
arch=(any)
url="https://github.com/baylej/tmx/"
license=('BSD')
depends=('zlib' 'libxml2' 'jansson')
makedepends=('git' 'cmake')
source=(git+https://github.com/baylej/tmx.git)
md5sums=('SKIP')
 
pkgver() {
	cd tmx
	git rev-parse --short HEAD
}
		 
build() {
	cd tmx
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make
}
					 
package() {
	cd tmx
	make DESTDIR="$pkgdir" install
	install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
