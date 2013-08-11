# Maintainer: Myles English < myles at rockhead dot biz >
# Contributer: Sebastian Eiser
pkgname=scotch_esmumps
pkgver=6.0.0
pkgrel=2
pkgdesc="libraries for graph, mesh and hypergraph partitioning, static mapping, and sparse matrix block ordering. This version  contains an interface for MUMPS. The sequential and parallel version are built"
url="http://www.labri.fr/perso/pelegrin/scotch/"
license="CeCILL-C free/libre software license"
depends=('zlib' 'openmpi')
provides=('ptscotch' 'scotch')
conflicts=('ptscotch' 'scotch' 'ptscotch-openmpi' 'ptscotch-mpich2')
arch=('any')
install=${pkgname}.install
source=("http://gforge.inria.fr/frs/download.php/31832/scotch_${pkgver}_esmumps.tar.gz")
md5sums=('c50d6187462ba801f9a82133ee666e8e')

build() {
  cd "${srcdir}/scotch_${pkgver}_esmumps"/src

  [ -e Makefile.inc ] && rm Makefile.inc
  cp Make.inc/Makefile.inc.i686_pc_linux2.shlib Makefile.inc
  sed -i 's/ -DSCOTCH_PTHREAD//' Makefile.inc
  sed -i "s|-O3|${CFLAGS}|g" Makefile.inc

  make scotch
  make ptscotch
  make esmumps
  make ptesmumps
}

package() {
  cd "${srcdir}/scotch_${pkgver}_esmumps/src"

  mkdir ${pkgdir}/usr
  make install prefix=${pkgdir}/usr

  install -m 644 "${srcdir}/scotch_${pkgver}_esmumps/lib/libesmumps.so" \
      "${srcdir}/scotch_${pkgver}_esmumps/lib/libptesmumps.so" ${pkgdir}/usr/lib/
  install -m 644 "${srcdir}/scotch_${pkgver}_esmumps/include/esmumps.h" \
      ${pkgdir}/usr/include/
  install -m 644 -D "${srcdir}/scotch_${pkgver}_esmumps/doc/CeCILL-C_V1-en.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#   cd "${pkgdir}/usr/lib"
#   for _FILE in `ls *.so`
#   do
#       mv -f ${_FILE} ${_FILE}.${pkgver}
#       ln -s ${_FILE}.${pkgver} ${_FILE}.${pkgver:0:1}
#   done

