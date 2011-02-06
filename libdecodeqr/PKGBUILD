# Maintainer: lolilolicon <+at gmail dot com>

pkgname=libdecodeqr
pkgver=0.9.3
pkgrel=2
pkgdesc="A C/C++ library for decoding QR code 2D barcodes"
url="http://trac.koka-in.org/libdecodeqr"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('opencv>=2.2.0')
makedepends=(pkg-config)
# original source: (server returns "ERROR 502: Bad Gateway")
# http://trac.koka-in.org/libdecodeqr/attachment/wiki/WikiStart/libdecodeqr-0.9.3.tar.bz2?format=raw
source=(http://ftp.de.debian.org/debian/pool/main/libd/libdecodeqr/libdecodeqr_0.9.3.orig.tar.gz
        fix_library_build.diff
        fix_ftbfs_590342.diff
        fix_opencv.diff)
md5sums=('df14ced6c15c432942ffba4bdd8feb82'
         '26750dd05f12bfb2cdc641c75e8776fa'
         'bc84dfccae62fab0f9b7a3009ee55fd4'
         '1a20dd9324743a9a6242008fde832016')

build() {
  cd "$srcdir"/libdecodeqr-0.9.3.orig/src

  # patches from debian
  patch -Np2 -i "${srcdir}"/fix_library_build.diff
  patch -Np2 -i "${srcdir}"/fix_ftbfs_590342.diff

  # patch for opencv 2.2.0
  patch -Np1 -i "${srcdir}"/fix_opencv.diff

  export LDFLAGS="-Wl,--hash-style=gnu -L/usr/lib"
  export CPPFLAGS="-I/usr/include/opencv"

  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir"/libdecodeqr-0.9.3.orig/src

  cd libdecodeqr

  install -d "${pkgdir}"/usr/include
  install -m0644 decodeqr.h qrerror.h qrtypes.h "${pkgdir}"/usr/include/
  install -d "${pkgdir}"/usr/lib
  install -m0755 libdecodeqr.a libdecodeqr.so.0.9.3 "${pkgdir}"/usr/lib/
  ln -s /usr/lib/libdecodeqr.so.0.9.3 "${pkgdir}"/usr/lib/libdecodeqr.so

  # test programs
  # sample/simple/simpletest # ./simpletest ../../../img/debian.org.qr.jpg
  # sample/webcam/webcam     # ./webcam
}
