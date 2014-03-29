# Maintainer: Julien Humbert <julroy67@gmail.com>
# http://cgit.freedesktop.org/~dvdhrm/miracle/
pkgname=miracle
pkgver=r58.87b804c
pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="MiracleCast - Wifi-Display/Miracast Implementation"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/miracle/"
license=('LGPL')
depends=('systemd>=212' 'glib2>=2.38' 'libwfd-miracle-git')
makedepends=()
source=("${pkgname}::git://people.freedesktop.org/~dvdhrm/miracle")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
