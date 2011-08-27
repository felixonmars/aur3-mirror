# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>
 
pkgname=knem
pkgver=0.9.5
pkgrel=1
pkgdesc="High-Performance Intra-Node MPI Communication"
arch=('any')
url="http://knem.gforge.inria.fr"
license=('bsd')
makedepends=('make')
depends=('hwloc')
optdepends=()
source=(http://runtime.bordeaux.inria.fr/knem/download/knem-$pkgver.tar.gz)
install=(knem.install)
sha1sums=('a627296c0f229b6cc7872ba8c841de9c3b699dc2')
 
build() {
  cd "knem-$pkgver"
  ./configure --prefix=/opt/knem
  make
  make install DESTDIR=$pkgdir
}

