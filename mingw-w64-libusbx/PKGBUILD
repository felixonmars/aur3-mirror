# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=mingw-w64-libusbx
pkgver=1.0.18
pkgrel=1
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
pkgdesc="Library that provides generic access to USB device (mingw-w64)"
arch=(any)
url="http://libusbx.org"
license=('LGPL')
source=("http://downloads.sourceforge.net/libusbx/releases/${pkgver}/libusbx-${pkgver}.tar.bz2")
options=('staticlibs' '!makeflags' '!strip' '!buildflags')
md5sums=('f2ccd0589dde901dfd5607459f77bf44')
         
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "libusbx-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch} \
                 --enable-shared
    make
    popd
  done
}

package () {
  cd "libusbx-${pkgver}"
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    popd
  done
}
