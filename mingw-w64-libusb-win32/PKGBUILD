pkgname=mingw-w64-libusb-win32
_pkgname=libusb-win32
pkgver=1.2.6.0
pkgrel=1
pkgdesc="Library to enable user space application programs to communicate with USB devices (mingw-w64)"
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
url="http://libusb.sourceforge.net/"
license=('LGPL')
source=(http://downloads.sourceforge.net/libusb-win32/libusb-win32-releases/$pkgver/libusb-win32-src-$pkgver.zip)
md5sums=('657cbed76601f97eee2cee1fdca2879a')
options=('!libtool' '!strip')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/$_pkgname-src-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS CFLAGS CPPFLAGS
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    cp -r ../src ../Makefile .
    make
    popd
  done
}

package () {
  cd "$srcdir/$_pkgname-src-$pkgver"
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
#     make install DESTDIR=$pkgdir
    popd
  done
}