pkgname=('hlcanopen-git')
pkgver=r17.3b23a4a
pkgrel=1
pkgdesc='hlCANopen is an high-level C++ library for the CANopen protocol'
arch=('any')
url='https://github.com/team-diana/hlCANopen'
license=('MIT')
depends=('boost')
makedepends=('git' 'cmake' 'make')
provides=('hlCANopen')
conflicts=()
md5sums=('SKIP')
source=('git://github.com/team-diana/hlCANopen.git')

pkgver() {
  cd "$srcdir/hlCANopen"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "$srcdir/hlCANopen"
  mkdir -p build
  cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
}

check() {
  cd "$srcdir/hlCANopen/build"
  make test
}

package() {
  cd "$srcdir/hlCANopen/build"
	make DESTDIR="$pkgdir" install
}

