# Contributor: Yue

pkgname=librevenge-git
_pkgname=librevenge
pkgver=1204.15dd36a
pkgrel=1
pkgdesc="A helper library for REVerses ENGineered formats filters"
arch=('i686' 'x86_64')
url="http://sf.net/p/libwpd/librevenge/"
license=('MPL2')
options=(!libtool)
provides=('librevenge')
conflicts=('librevenge')
depends=('zlib')
makedepends=('git' 'boost')
source=(git://git.code.sf.net/p/libwpd/librevenge)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --disable-werror --without-docs --enable-static=no --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}
