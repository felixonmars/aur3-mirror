# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: jimmy-6
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=mingw32-libnoise
pkgver=1.0.0
pkgrel=1
pkgdesc="A portable, open-source, coherent noise-generating library for C++"
arch=('any')
url="http://libnoise.sourceforge.net/"
license=('LGPL')
makedepends=('mingw32-gcc' 'cmake' 'unzip')
options=(!strip !buildflags)
source=("http://prdownloads.sourceforge.net/libnoise/libnoisesrc-${pkgver}.zip"
        'CMakeLists.txt'
	'COPYING')
md5sums=('fc0d9b4f6477397568c3a9d5294b3b8c'
         '913a4145cdc7c38d43698386321ea85b'
	 'ff2016bd98a6368367edf64aabab0939')

prepare() {
  cp CMakeLists.txt noise
}

build() {
  rm -rf build && mkdir build && cd build

  cmake \
    -D CMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_SYSTEM_NAME=Windows \
    -D CMAKE_RC_COMPILER="/usr/bin/i486-mingw32-windres" \
    -D CMAKE_C_COMPILER="/usr/bin/i486-mingw32-gcc" \
    -D CMAKE_CXX_COMPILER="/usr/bin/i486-mingw32-g++" \
    ../noise
  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install

  mkdir -p ${pkgdir}/usr/i486-mingw32/bin
  mv ${pkgdir}/usr/i486-mingw32/lib/*.dll ${pkgdir}/usr/i486-mingw32/bin

  install -Dm 644 ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
