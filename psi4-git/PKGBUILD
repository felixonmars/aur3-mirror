# Maintainer: Guido Masella <guido.masella@gmail.com>

pkgname=psi4-git
pkgrel=6
pkgver=r6560.a6a3063
pkgdesc="Ab initio quantum chemistry program"
arch=('i686' 'x86_64')
url="http://www.psicode.org"
license=('GPL')
depends=('python2' 'atlas-lapack' 'boost-libs')
makedepends=('git' 'python2' 'atlas-lapack' 'boost' 'boost-libs')
conflicts=('psi4')
provides=('psi4')
source=("$pkgname"::'git://github.com/psi4/psi4public.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  autoconf
  if [ ! -d obj ]; then
      mkdir obj;
  fi
  cd obj
  # atlas-lapack is highly-recommended for best performances
  ../configure PYTHON=/usr/bin/python2.7 --prefix=/usr --with-blas='-lf77blas -latlas' --with-lapack='-llapack -lcblas'
  make
  #make tests
}

package() {
  cd "$srcdir/$pkgname"
  cd obj
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
