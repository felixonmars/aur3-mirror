pkgname=uci
pkgver=1
pkgrel=1
pkgdesc="Unified Configuration Interface (UCI)"
arch=(i686 x86_64)
url="http://openwrt.org"
license=('GPL')
depends=('libubox' 'lua51')
makedepends=('git')
source=("uci::git://nbd.name/uci.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR=$pkgdir
}
