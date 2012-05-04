# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

pkgname=starpu
pkgver=1.0.0
pkgrel=3
pkgdesc="StarPU Runtime System"
arch=('i686' 'x86_64')
url="http://runtime.bordeaux.inria.fr/StarPU/"
license=('GPL')
makedepends=('make' 'gcc' 'hwloc')
source=(https://gforge.inria.fr/frs/download.php/30478/${pkgname}-${pkgver}.tar.gz)
md5sums=('34177fa00fcff9f75b7650b307276b07')

build() {
   cd "$pkgname-$pkgver"

   ./configure --prefix=/usr --with-cuda-dir=/opt/cuda-toolkit/ --disable-starpufft
   make
   make DESTDIR=$pkgdir install
}
