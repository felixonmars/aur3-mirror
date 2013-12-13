# Maintainer: Uroc327 <uroc327@cssbook.de>

_pkgbasename=glfw
pkgname=lib32-${_pkgbasename}3
pkgver=3.0.3
pkgrel=1
pkgdesc="A free, open source, portable framework for OpenGL application development (32-bit)"
arch=('x86_64')
url="http://www.glfw.org/"
license=('custom:ZLIB')
depends=('lib32-libgl' 'lib32-libxrandr' 'lib32-glu' 'xorg-xinput' 'lib32-mesa' 'lib32-libxi')
makedepends=('lib32-mesa' 'cmake' 'doxygen')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.bz2")
md5sums=('623977c096b28c25528e3c958e9fb3fd')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  export CC="gcc -m32" LDFLAGS="-m32 -L/usr/lib32 -Wl,-rpath,/usr/lib32"
  export LFLAGS+="-lrt"

  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON \
      -DLIB_SUFFIX=32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  cd build
  make DESTDIR=${pkgdir} install

  cd ..
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  rm -rf "${pkgdir}"/usr/{include,bin}
}
