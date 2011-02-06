# Maintainer: Lajos Kovacs <klajos at archlinux us>
pkgname=gdb-armulator
pkgver=5.0
pkgrel=2
pkgdesc="A MMU-less ARM7 emulator"
arch=(i686)
url="http://www.uclinux.org/pub/uClinux/utilities/armulator/"
license=('GPL')
depends=('ncurses')
source=(ftp://sourceware.org/pub/gdb/old-releases/gdb-${pkgver}.tar.bz2
        http://www.uclinux.org/pub/uClinux/utilities/armulator/gdb-5.0-uclinux-armulator-20060104.patch.gz
	http://www.uclinux.org/pub/uClinux/utilities/armulator/objstack.patch.gz)
md5sums=(b2720def719fd024e380793d9084da2a
         6afac1b7ec1191390c854be1e5cc5724
	 e0581fde4b75de1a6d57e11dfb323acb)

build() {
  cd ${startdir}/src/gdb-${pkgver}

  patch -Np1 -i ../gdb-5.0-uclinux-armulator-20060104.patch || return 1
  patch -Np1 -i ../objstack.patch || return 1

  ./configure --target=arm-elf --prefix=${startdir}/pkg/usr || return 1
  make || return 1
  make install || return 1

  # We only need executables; say goodbye to the others
  rm -rf ${startdir}/pkg/usr/{include,lib,man,share}
}
