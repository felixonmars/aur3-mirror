# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=mingw32-cmake
pkgver=1
pkgrel=1
arch=(any)
pkgdesc="CMake wrapper for MinGW (mingw32)"
depends=(cmake mingw32-gcc)
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("i486-mingw32-cmake"
        "toolchain-i486-mingw32.cmake")
md5sums=('f90df8d0469132d1893aa7d3021d37fc'
         '12f275209e6b810ae8d4d445bc7887cc')

package() {
  cd "${pkgdir}"

  install -d "${pkgdir}"/usr/bin
  install -m 755 "${srcdir}"/i486-mingw32-cmake "${pkgdir}"/usr/bin/

  install -d "${pkgdir}"/usr/share/mingw
  install -m 644 "${srcdir}"/toolchain-i486-mingw32.cmake "${pkgdir}"/usr/share/mingw/
}
