# Maintainer: Matthew "Zashi" Hiles <zashi at vay 8 dot net>

pkgname=mspgcc-msp430-libc
pkgver=20120224
pkgrel=1
pkgdesc="C runtime library for the MSP430 family of microcontrollers"
arch=('i686' 'x86_64')
url="http://mspgcc.sf.net"
license=('GPL')
groups=()
depends=('mspgcc-binutils' 'mspgcc-mspgcc' 'mspgcc-msp430mcu')
makedepends=()
provides=()
conflicts=('msp430-libc')
replaces=()
backup=()
options=(!strip)
install=
source=("https://sourceforge.net/projects/mspgcc/files/msp430-libc/msp430-libc-${pkgver}.tar.bz2")
noextract=()
md5sums=('1ccfbd40de06f85aeb2e74f028789418')

build() {
  cd "${srcdir}/msp430-libc-${pkgver}/src"
  #
  # BUILD HERE
  #
  make PREFIX=/usr
}

package() {
  msg "Begin packaging"

  cd "${srcdir}/msp430-libc-${pkgver}/src"
  mkdir -p ${pkgdir}/usr/msp430/lib
  make -j1 install PREFIX=${pkgdir}/usr

  _docdir=${pkgdir}/usr/share/doc/${pkgname}
  cd ${srcdir}/msp430-libc-${pkgver}/src

#  install -Dm644 devheaders.txt ${_docdir}/devheaders.txt
#  install -Dm644 volatil        ${_docdir}/volatile.txt
}
