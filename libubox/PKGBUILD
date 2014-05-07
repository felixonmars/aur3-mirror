pkgname=libubox
pkgver=1
pkgrel=1
pkgdesc="Minimalistic JSON based scripting engine"
arch=(i686 x86_64)
url="http://openwrt.org"
license=('GPL')
depends=('json-c')
makedepends=('git')
source=("libubox::git://nbd.name/luci2/libubox.git")
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
