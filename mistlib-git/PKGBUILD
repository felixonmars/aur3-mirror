pkgname=mistlib-git
pkgdesc="mistlib git development branch"
pkgver=5.1.2
pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/./g'
}
pkgrel=1
license=('AGPL')
arch=('i686' 'x86_64')
url="https://github.com/DDVTECH/mistlib"
makedepends=('git')
source=('mistlib-git::git+http://github.com/DDVTECH/mistlib.git#branch=development')
md5sums=('SKIP')
build() {
  cd "$srcdir/$pkgname"
  autoreconf -fi
  ./configure --prefix=/usr
  make
}
package() {
  make -C "$srcdir/$pkgname" PREFIX=/usr DESTDIR="$pkgdir" install
}
