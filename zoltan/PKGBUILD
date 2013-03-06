# Maintainer: Dan Ibanez <dibanez@scorec.rpi.edu>
pkgname=zoltan
pkgver=3.6
pkgrel=1
pkgdesc="Parallel Partitioning, Load Balancing and Data-Management Services"
arch=('i686' 'x86_64')
url="http://www.cs.sandia.gov/Zoltan/"
license=('LGPL')
depends=(openmpi parmetis ptscotch)
source=(http://www.cs.sandia.gov/~kddevin/Zoltan_Distributions/zoltan_distrib_v3.6.tar.gz)
md5sums=('9cce794f7241ecd8dbea36c3d7a880f9')

build() {
  cd "$srcdir/Zoltan_v3.6"

  sed -i \
'248 c\  LIBS="-L${tac_with_scotch_libdir} -lptscotch  -lscotch -lptscotcherrexit ${LIBS}"'\
  configure.ac
  sed -i \
'51 s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g'\
  configure.ac
  autoreconf -i
  mkdir build
  cd build
  ../configure --prefix=/usr \
               --enable-mpi \
               --with-gnumake \
               --with-scotch \
               --with-scotch-incdir=/usr/include \
               --with-scotch-libdir=/usr/lib \
               --with-parmetis \
               --with-parmetis-incdir=/usr/include \
               --with-parmetis-libdir=/usr/lib
  make everything
}

package() {
  cd "$srcdir/Zoltan_v3.6/build"

  make prefix="$pkgdir/usr" install
}
