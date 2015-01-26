# Mantainer: Ivan Pulido <ijpulidos@riseup.net>
pkgname=sundials
pkgver=2.5.0
pkgrel=5
pkgdesc="Suite of nonlinear differential/algebraic equation solvers"
arch=('i686' 'x86_64')
url="https://computation.llnl.gov/casc/sundials/main.html"
license=('BSD')
depends=(bash)
source=(http://ftp.mcs.anl.gov/pub/petsc/externalpackages/$pkgname-$pkgver.tar.gz)
md5sums=('aba8b56eec600de3109cfb967aa3ba0f') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure F77=gfortran --prefix=/usr --disable-mpi --with-cflags=-fPIC --enable-shared
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr/" install
}

# vim:set ts=2 sw=2 et:
