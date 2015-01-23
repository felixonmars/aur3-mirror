pkgname=ampl-mp
pkgver=1.3.0
pkgrel=1
pkgdesc="The AMPL Solver Library (ASL)"
arch=('i686' 'x86_64')
license=(MIT)
url="https://github.com/ampl/mp"
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/ampl/mp/archive/${pkgver}.tar.gz")
md5sums=('a369cb89812801a0481154074d3c8b30')

build()
{
  cd "$srcdir/mp-${pkgver}"
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON ..
}

check() {
  cd "$srcdir/mp-${pkgver}"
  make test
}

package ()
{
  cd "$srcdir/mp-${pkgver}/build"
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/bin
}

