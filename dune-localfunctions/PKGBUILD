pkgname=dune-localfunctions
pkgver=2.0
pkgrel=1
pkgdesc="The Distributed and Unified Numerics Environment is a modular toolbox for solving partial differential equations (PDEs) with grid-based methods."
url="http://www.dune-project.org/"
arch=('any')
license=('GPL')
groups=('dune-project')
depends=('dune-common' 'dune-grid')
source=(http://www.dune-project.org/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('945bcb11fa47941b0788c5dd69e4fed3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --disable-gxx0xcheck --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
