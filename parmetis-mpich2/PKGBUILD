# Contributor: Jed Brown <jed@59A2.org>
pkgname=(parmetis-mpich2)
_prefix=/opt/mpich2
pkgver=4.0.2
pkgrel=1
pkgdesc="A parallel graph partitioning library, built against MPICH2"
url="http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview"
arch=('i686' 'x86_64')
license="custom"
depends=(mpich2)
makedepends=(cmake)
conflicts=()
replaces=()
backup=()
source=(http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-$pkgver.tar.gz)
md5sums=('0912a953da5bb9b5e5e10542298ffdce')

build() {
  cd $srcdir/parmetis-$pkgver
  patch -p1 <<EOF
diff --git i/Makefile w/Makefile
index 501607e..7363648 100644
--- i/Makefile
+++ w/Makefile
@@ -53,6 +53,12 @@ endif
 ifneq ($(cc), not-set)
     CONFIG_FLAGS += -DCMAKE_C_COMPILER=$(cc)
 endif
+ifneq ($(mpicc), not-set)
+    CONFIG_FLAGS += -DMPI_C_COMPILER=$(mpicc)
+endif
+ifneq ($(mpicxx), not-set)
+    CONFIG_FLAGS += -DMPI_CXX_COMPILER=$(mpicxx)
+endif
EOF
  make config cc=${_prefix}/bin/mpicc mpicc=${_prefix}/bin/mpicc mpicxx=${_prefix}/bin/mpicxx shared=1 prefix=${_prefix}
  make
}

package () {
  cd $srcdir/parmetis-$pkgver
  make install DESTDIR=$pkgdir
}
