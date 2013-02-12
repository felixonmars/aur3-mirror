pkgname=dune-istl
pkgver=2.0
pkgrel=1
pkgdesc="The Distributed and Unified Numerics Environment is a modular toolbox for solving partial differential equations (PDEs) with grid-based methods."
url="http://www.dune-project.org/"
arch=('any')
license=('GPL')
groups=('dune-project')
depends=('dune-common')
source=(http://www.dune-project.org/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('1fd19d6eaa395a3806daf568d80ac9b1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --disable-gxx0xcheck --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
