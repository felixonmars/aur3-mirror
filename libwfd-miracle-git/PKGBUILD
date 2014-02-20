# Maintainer: Julien Humbert <julroy67@gmail.com>
# http://cgit.freedesktop.org/~dvdhrm/libwfd/
pkgname=libwfd-miracle-git
pkgver=r15.21a82b9
pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Wifi-Display/Miracast Protocol Implementation"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/~dvdhrm/libwfd/"
license=('MIT')
depends=()
makedepends=()
source=("${pkgname}::git://people.freedesktop.org/~dvdhrm/libwfd")
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
