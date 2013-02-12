pkgname=dune-common
pkgver=2.0
pkgrel=1
pkgdesc="The Distributed and Unified Numerics Environment is a modular toolbox for solving partial differential equations (PDEs) with grid-based methods."
url="http://www.dune-project.org/"
arch=('any')
license=('GPL')
groups=('dune-project')
depends=('sh' 'bash')
source=(http://www.dune-project.org/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('3f7f50f28700f439eb3c9d0fc6daf863')
options=('!libtool')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --disable-gxx0xcheck --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
