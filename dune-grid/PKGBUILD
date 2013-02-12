pkgname=dune-grid
pkgver=2.0
pkgrel=1
pkgdesc="The Distributed and Unified Numerics Environment is a modular toolbox for solving partial differential equations (PDEs) with grid-based methods."
url="http://www.dune-project.org/"
arch=('any')
license=('GPL')
groups=('dune-project')
depends=('dune-common')
source=(http://www.dune-project.org/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('d32b21ef013179c89e3f0c453bb4ed02')
options=('!libtool')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # "make install" trys to compile a latex source file that is not available
  sed -i -e "/refinement.tex/,+1d" "$srcdir/$pkgname-$pkgver/doc/refinement/Makefile.am"

  ./configure --disable-gxx0xcheck --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
