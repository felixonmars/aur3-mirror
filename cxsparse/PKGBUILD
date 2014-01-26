# Contributor: Richard Molitor <richard.molitor@student.kit.edu>
pkgname=cxsparse
pkgver=3.1.2
pkgrel=1
pkgdesc="a concise sparse matrix package"
arch=('i686' 'x86_64')
url="http://www.cise.ufl.edu/research/sparse/CXSparse/"
license=('LGPL')
depends=()
makedepends=()
options=('staticlibs')
provides=('csparse')
install=
source=("http://www.cise.ufl.edu/research/sparse/CXSparse/CXSparse.tar.gz"
        "http://www.cise.ufl.edu/research/sparse/SuiteSparse_config/SuiteSparse_config-4.2.1.tar.gz"
        "SuiteSparse_config.mk.patch"
        "Makefile.patch")
md5sums=('1406442cd2741e9786393bfa7514c17f'
         'f9d709f442ab13e0cf0f53d6b516abd1'
         '07322fc438896c3408dc164d0584e8ad'
         '7730397793f16770b05b986acb2090f9')

prepare() {
  cd "$srcdir/SuiteSparse_config"

  msg "Patching config"
  patch SuiteSparse_config.mk ../SuiteSparse_config.mk.patch

  cd "$srcdir/CXSparse"

  msg "Patching Makefile"
  patch Makefile ../Makefile.patch
}

build() {
  cd "$srcdir/CXSparse"

  msg "Building library..."
  make C
}

#check() {
#  cd "$srcdir/CXSparse"
#
#  msg "Testing library..."
#  make cov
#}

package() {
  mkdir -p ${pkgdir}/usr/lib ${pkgdir}/usr/include

  cd "$srcdir/CXSparse"
  make DESTDIR="${pkgdir}" install
 
  cd "$srcdir/SuiteSparse_config"
  install -Dm644 SuiteSparse_config.h "${pkgdir}/usr/include"
}

# vim:set ts=2 sw=2 et:
