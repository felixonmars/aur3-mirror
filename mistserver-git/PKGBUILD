pkgname=mistserver-git
pkgdesc="mistserver git development branch"
pkgver=1.1.1
pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/./g'
}
pkgrel=1
license=('AGPL')
arch=('i686' 'x86_64')
url="https://github.com/DDVTECH/mistserver"
makedepends=('git')
source=('mistserver-git::git+http://github.com/DDVTECH/mistserver.git#branch=development')
md5sums=('SKIP')
build() {
  cd "$srcdir/$pkgname"
  autoreconf -fi
  PKG_CONFIG_PATH=/usr/bin/pkg-config ./configure --prefix=/usr
  make
}

package() {
  make -C "$srcdir/$pkgname" PREFIX=/usr DESTDIR="$pkgdir" install
}
