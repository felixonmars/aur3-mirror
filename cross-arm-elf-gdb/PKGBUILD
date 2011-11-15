# $Id:$
# Adapted from standard gdb package 
# Maintainer: Andreas Messer <andi@surveycorner.de>

pkgname=cross-arm-elf-gdb
pkgver=7.3.1
pkgrel=1
pkgdesc="The GNU Debugger for ARM target"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=('ncurses' 'expat' 'python2')
makedepends=('texinfo')
optdepends=('openocd: for debugging jtag targets')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.bz2)
md5sums=('b89a5fac359c618dda97b88645ceab47')

build() {
  cd ${srcdir}/gdb-${pkgver}
  
  ./configure --prefix=/usr \
	--target=arm-elf \
	--host=$CHOST \
	--build=$CHOST \
	--disable-nls --with-system-readline \
	--with-local-prefix=/usr/lib/cross-arm

  make || return 1
}

package() {
  cd ${srcdir}/gdb-${pkgver}
  make DESTDIR=${pkgdir} install || return 1

  # resolve conflicts with binutils / remove unneeded files
  rm -f  ${pkgdir}/usr/include/{bfd,dis-asm,symcat,ansidecl,bfdlink}.h
  rm -f  ${pkgdir}/usr/lib/{libiberty,libbfd,libopcodes}.a
  rm -rf ${pkgdir}/usr/share/info
  rm -rf ${pkgdir}/usr/share/gdb/syscalls
  rm -rf ${pkgdir}/usr/share/gdb/syscalls
  rm -rf ${pkgdir}/usr/share/gdb/python
}
