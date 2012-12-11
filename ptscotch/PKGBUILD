# Maintainer: Myles English < myles at rockhead dot biz >
pkgname=ptscotch
pkgver=6.0.0
pkgrel=1
_prefix=/usr
pkgdesc="libraries for graph, mesh and hypergraph partitioning, static mapping, and sparse matrix block ordering. This is the parallel version using openmpi and shared libraries."
url="http://www.labri.fr/perso/pelegrin/scotch/"
license="CeCILL-C free/libre software license"
depends=('openmpi' 'numactl')
provides=('ptscotch')
conflicts=('ptscotch-openmpi' 'ptscotch-mpich2')
replaces=()
backup=()
arch=('any')
source=("https://gforge.inria.fr/frs/download.php/31831/scotch_6.0.0.tar.gz")
md5sums=('ba117428c0a6cd97d0c93e8b872bb3fe')

build() {
  cd "${srcdir}/scotch_${pkgver}"/src

  [ -e Makefile.inc ] && rm Makefile.inc
  cp Make.inc/Makefile.inc.i686_pc_linux2.shlib Makefile.inc 
  sed -i 's/ -DSCOTCH_PTHREAD//' Makefile.inc

  make ptscotch
}

package() {
  mkdir ${pkgdir}/usr
  cd "${srcdir}/scotch_${pkgver}/src"
  make install prefix=${pkgdir}/usr
  install -m 644 -D "${srcdir}/scotch_${pkgver}/doc/CeCILL-C_V1-en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
