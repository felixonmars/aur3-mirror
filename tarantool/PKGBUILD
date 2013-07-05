pkgname=tarantool
pkgver=1.4.9.93.g93e547a
pkgrel=1
pkgdesc="persistent, transactional in-memory database"
arch=(i686 x86_64)
url="http://www.tarantool.org"
license=(BSD)
depends=()
# gcc has problems with HEAD tarantool
makedepends=(cmake clang)
source=("tarantool::git://github.com/mailru/tarantool#branch=stable")
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  cd $srcdir/$pkgname
  CC=clang cmake .
  make
}

package() {
  cd $srcdir/$pkgname
  make install DESTDIR=$pkgdir
}
