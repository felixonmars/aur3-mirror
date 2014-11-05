# Maintainer: Antonio Rojas <nqn76sw@gmail.com>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>

pkgname=m4ri
pkgver=20140914
pkgrel=1
pkgdesc="Algorithms for linear algebra over F_2"
arch=('i686' 'x86_64')
url="http://m4ri.sagemath.org/"
license=('GPL')
depends=('libpng')
source=(http://m4ri.sagemath.org/downloads/m4ri/$pkgname-$pkgver.tar.gz)
md5sums=('91d964b6c6754499da81277433605199')

build() {
  cd m4ri-$pkgver
  ./configure --prefix=/usr --with-openmp
  make
}

check() {
  cd m4ri-$pkgver
  make check
}

package() {
  cd m4ri-$pkgver
  make install DESTDIR="$pkgdir"
}

