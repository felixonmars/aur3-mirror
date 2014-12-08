# Maintainer:  Tim Langlois <langlois at cs.cornell.edu>

pkgname=cork
pkgver=r23.2454ab3
pkgrel=1
pkgdesc="Boolean/CSG library"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://github.com/gilbo/cork"
depends=('gmp')
makedepends=('git' 'clang' 'llvm')
provides=("cork=$pkgver")
source=("$pkgname"::'git+https://github.com/gilbo/cork.git')
md5sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 bin/cork "$pkgdir/usr/bin/cork"
  install -D -m644 lib/libcork.a "$pkgdir/usr/lib/libcork.a"
  install -D -m644 include/cork.h "$pkgdir/usr/include/cork.h"
}
