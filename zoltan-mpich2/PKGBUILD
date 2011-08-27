# Contributor: Jed Brown <jed@59A2.org>
pkgname=(zoltan-mpich2)
_prefix=/opt/mpich2
pkgver=3.1
pkgrel=1
pkgdesc="Parallel Partitioning, Load Balancing and Data-Management Services"
url="http://www.cs.sandia.gov/Zoltan/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=()
makedepends=(parmetis-mpich2 mpich2)
conflicts=()
replaces=()
backup=()
source=(http://www.cs.sandia.gov/~kddevin/Zoltan_Distributions/zoltan_distrib_v3.1.tar.gz)

build() {
  cd $startdir/src
  patch -p0 <<EOF
--- Zoltan_v3.1/src/driver/dr_param_fileCPP.cpp.orig    2008-10-23 13:59:31.000000000 +0200
+++ Zoltan_v3.1/src/driver/dr_param_fileCPP.cpp 2008-10-23 13:59:51.000000000 +0200
@@ -31,8 +31,8 @@
 
 */
 
-#include <stdio.h>
 #include <mpi.h>
+#include <stdio.h>
 #include <stdlib.h>
 #include "zoltan_cpp.h"
 #include "dr_param_fileCPP.h"
EOF
  mkdir build
  cd build
  ../Zoltan_v3.1/configure CC=${_prefix}/bin/mpicc CXX=${_prefix}/bin/mpiCC F77=${_prefix}/bin/mpif77 FC=${_prefix}/bin/mpif90 --with-mpi-compilers=${_prefix}/bin --with-parmetis --with-parmetis-libdir=${_prefix}/lib --with-parmetis-incdir=${_prefix}/include --prefix=${_prefix}
  make || exit 1
  make prefix=${pkgdir}${_prefix} install || exit 1
}
md5sums=('2322512b79df3d66c10c0d26ce94fca7')
