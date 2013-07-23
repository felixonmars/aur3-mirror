# $Id$
# Mantainer: Jens Staal <staal1978@gmail.com>

pkgname=ddekit-linux
pkgver=1
pkgrel=1
pkgdesc='The DDEKit Linux interface library, to build userspace DDE drivers for Linux'
url='http://os.inf.tu-dresden.de/ddekit/'
license=('BSD')
arch=('i686' 'x86_64')
depends=('pciutils')
makedepends=('gcc')

source=('http://os.inf.tu-dresden.de/ddekit/ddekit-linux.tar.bz2')
md5sums=('4b949202f7c89b0e079d6524b3793415')

prepare() {
#for some reason the archive contains object files
  cd ${srcdir}/ddekit-linux/ddekit-linux
  make clean
}

build() {
  cd ${srcdir}/ddekit-linux/ddekit-linux
  # this will generate a static library.
  # a dynamic library is optional
  make
}

package() {
  mkdir -p ${pkgdir}/usr/include/ddekit
  mkdir -p ${pkgdir}/usr/lib
  install -m644 ${srcdir}/ddekit-linux/ddekit_header/include/ddekit/*.h  ${pkgdir}/usr/include/ddekit/
  install -m 644 ${srcdir}/ddekit-linux/ddekit-linux/libddekit.a ${pkgdir}/usr/lib/
  
}

