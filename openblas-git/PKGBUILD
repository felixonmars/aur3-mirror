# Maintainer: anergy <anergy.25100321@gmail.com>

pkgname=openblas-git
_gitname=openblas
pkgver=v0.2.7.61.g3f7b0cd
pkgver() {
    cd "${srcdir}/${_gitname}"
    local ver=`git describe`
    #printf `git describe`
    echo ${ver//-/.}
}

pkgrel=1
pkgdesc="optimized BLAS library based on GotoBLAS2 1.13 BSD version"
arch=(i686 x86_64)
url="https://github.com/xianyi/OpenBLAS"
license=('BSD')
groups=()
depends=()
makedepends=('git' 'gcc-fortran')
provides=('openblas' 'blas=3.4.2' 'cblas')
conflicts=('openblas' 'blas' 'cblas')
replaces=()
backup=()
options=()

source=("${_gitname}::git://github.com/xianyi/OpenBLAS.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "${srcdir}/$_gitname"
  make PREFIX="${pkgdir}/usr" install
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${_gitname}/LICENSE
  # remove lapacke header files
  rm "${pkgdir}/usr/include/lapacke_config.h"
  rm "${pkgdir}/usr/include/lapacke_mangling.h"
  rm "${pkgdir}/usr/include/lapacke.h"
  rm "${pkgdir}/usr/include/lapacke_utils.h"
  # blas to libblas.so
  cd "${pkgdir}/usr/lib"
  ln -sf libopenblas.so libblas.so
}

# vim:set ts=2 sw=2 et:
