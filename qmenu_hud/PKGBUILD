
pkgname=qmenu_hud
arch=('i686' 'x86_64')
pkgver=0.1.0
pkgrel=1
pkgdesc="a small menu search program, similar to Unity's HUD"
url="https://github.com/tetzank/qmenu_hud/"
license=('GPL2')
makedepends=('cmake')
depends=('qt4' 'libdbusmenu-qt' 'appmenu-qt' 'libx11' 'dmenu')
source=(https://github.com/tetzank/qmenu_hud/archive/${pkgver}.tar.gz)
md5sums=('256c586a67d7e0bfde5bec47ef599469')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
}
