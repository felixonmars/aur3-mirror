# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>
pkgname=mingw32-libopencl
pkgver=1.1
pkgrel=3
pkgdesc="OpenCL import library (mingw32)."
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('mingw32-binutils')
source=(libOpenCL.a)
noextract=(libOpenCL.a)
options=(!strip !buildflags)
url="http://www.khronos.org/registry/cl/"
md5sums=('7177a36b2052594ff22beaa405ff6416')

mingw32=i486-mingw32

build() {
  
  cd "$srcdir"
}

package() {
  install -Dm644 "${srcdir}/libOpenCL.a" "${pkgdir}/usr/${mingw32}/lib/libOpenCL.a"
}
