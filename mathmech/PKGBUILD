# Author: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>
# Maintainer: Evgeniy "arcanis" Alexeev <arcanis.arch at gmail dot com>

pkgname=mathmech
pkgver=1.2.0
pkgrel=2
pkgdesc="Software package for analysis of molecular dynamics trajectories"
arch=('i686' 'x86_64')
url="http://arcan1s.github.io/projects/moldyn"
license=('Beerware')
depends=('qwt')
makedepends=('cmake' 'automoc4')
source=(https://github.com/arcan1s/moldyn/releases/download/mm-${pkgver}/${pkgname}-${pkgver}-src.zip)
md5sums=('46d8e1a3d6bc30d5b0b57ccf485986b1')
_cmakekeys="-DCMAKE_INSTALL_PREFIX=/usr
            -DQWT_INCLUDE_PATH=/usr/include/qwt
            -DQWT_LIBRARY_PATH=/usr/lib
            -DMM_PREFIX=mm_
            -DADD_DOCS:BOOL=0
            -DADD_INCLUDE:BOOL=0
            -DCMAKE_BUILD_TYPE=Release"

prepare() {
  [[ -d ${srcdir}/build ]] && rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake ${_cmakekeys} ../
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
 
