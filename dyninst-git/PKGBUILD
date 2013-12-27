# Maintainer: Ishan Arora <ishanarora@gmail.com>

pkgname=dyninst-git
pkgver=r17700.d35d7b0
pkgrel=1
pkgdesc="An API for run-time code generation"
url="http://www.dyninst.org"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('boost' 'libdwarf')
install="dyninst.install"
source=('git+http://git.dyninst.org/dyninst.git')
sha1sums=(SKIP)
conflicts=('dyninst')
provides=('dyninst')

pkgver() {
  cd "$srcdir/dyninst"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/dyninst"
  unset LDFLAGS
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/dyninst"
  cd build
  make DESTDIR="$pkgdir" install
}
