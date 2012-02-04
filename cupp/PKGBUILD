# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=cupp
pkgver=0.1.2
pkgrel=1
pkgdesc="C++ framework for CUDA"
url="http://www.plm.eecs.uni-kassel.de/plm/index.php?id=cupp"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('cmake>=2.6' 'doxygen')
depends=('cuda>=2.0' 'boost')
source=("http://www.plm.eecs.uni-kassel.de/CuPP/static/cupp_v${pkgver}.tar.gz")

build() {
  
 cd "$pkgname"

  cmake -DCMAKE_BUILD_TYPE=RELEASE

  make || return 1
  make DESTDIR=$startdir/pkg install
  doxygen || return 1
  mkdir -p $startdir/pkg/usr/share/doc/cupp
  cd doc
  cp -r * $startdir/pkg/usr/share/doc/cupp/
}
md5sums=('09ac68dbe0f2204beae005f6c69989bd')
