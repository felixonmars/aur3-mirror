# Maintainer: Jed Brown <jedbrown>
pkgname=ptscotch-mpich2
pkgver=5.1.12b
_pkgver=5.1.12
pkgrel=1
_prefix=/opt/mpich2
pkgdesc="SCOTCH is a software package and libraries for graph, mesh and hypergraph partitioning, static mapping, and sparse matrix block ordering. This is the Parallel version using MPI."
url="http://www.labri.fr/perso/pelegrin/scotch/"
license="custom: CeCILL-C free/libre software license"
depends=('mpich2' 'numactl')
provides=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
source=("http://gforge.inria.fr/frs/download.php/28977/scotch_${pkgver}.tar.gz")
md5sums=('5d912599c2521b1ecbcd8d12b68eef9c')

build() {
  cd "${srcdir}/scotch_${_pkgver}"

  cd src
  sed "s,-O3,$CFLAGS,g" Make.inc/Makefile.inc.x86-64_pc_linux2 > Makefile.inc
  sed -i "s,= mpicc,= ${_prefix}/bin/mpicc,g" Makefile.inc

  make ptscotch

  cd "${srcdir}/scotch_${_pkgver}"
  install -d "${pkgdir}/${_prefix}"/{bin,lib,include/scotch}
  install -m 644 -t "${pkgdir}/${_prefix}"/include/scotch include/*.h
  install -m 644 -t "${pkgdir}/${_prefix}"/lib lib/lib*.a
  install -m 755 -t "${pkgdir}/${_prefix}"/bin bin/*
  install -m 644 -D "${srcdir}/scotch_${_pkgver}/doc/CeCILL-C_V1-en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
