# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>

_pkgname=naemon
_gitname=naemon-livestatus
pkgname=naemon-livestatus-git
pkgver=0.8.0.r26.g6e69549
pkgrel=1
pkgdesc="Standard API for Naemon"
arch=('i686' 'x86_64')
url="http://naemon.org"
license=('GPL2')
depends=('icu')
makedepends=('git')
source=(git://github.com/naemon/$_gitname.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname

  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//' 
}

build() {
  cd "$srcdir"/$_gitname

  libtoolize
  aclocal
  autoheader
  automake --add-missing
  autoconf
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir"/$_gitname

  make DESTDIR="$pkgdir"/ install
}
