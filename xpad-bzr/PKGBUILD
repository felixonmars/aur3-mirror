# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: cahr_g <cahr.gr@gmail.com>

_pkgname=xpad
pkgname=xpad-bzr
pkgver=r727
pkgrel=1
pkgdesc="Stickies-like notes program"
arch=(i686 x86_64)
url="https://launchpad.net/xpad"
license=('GPL')
depends=('gtk3' 'libsm' 'librsvg' 'gtksourceview3')
makedepends=('bzr' 'intltool')
conflicts=('xpad')
provides=('xpad')
install=xpad.install
source=(bzr+lp:xpad)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR=${pkgdir} install helpdir=/usr/lib/xpad/help
}
