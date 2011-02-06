# $Id:$
# Adapted from cross-arm-elf-gdb package

pkgname=cross-m68k-elf-gdb
pkgver=7.0
pkgrel=1
pkgdesc="The GNU Debugger for Motorola 68000 target"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=('ncurses' 'expat' 'python')
makedepends=('texinfo')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.bz2
        gdb-readline-6.0.patch)
md5sums=('3386a7b69c010785c920ffc1e9cb890a'
         '82e9eac057954899092405e9ef97d029')

build() {
  cd ${srcdir}/gdb-${pkgver}
  patch -Np1 -i $srcdir/gdb-readline-6.0.patch
  
  rm -rf build
  mkdir build
  cd build

  ../configure --prefix=/usr \
	--target=m68k-elf \
	--host=$CHOST \
	--build=$CHOST \
	--disable-nls --with-system-readline
	--with-local-prefix=/usr/lib/cross-m68k \
	--with-sysroot=/usr/$CHOST/m68k-elf

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # resolve conflicts with binutils / remove unneeded files
  rm -f ${pkgdir}/usr/include/{bfd,dis-asm,symcat,ansidecl,bfdlink}.h
  rm -f ${pkgdir}/usr/share/gdb/syscalls/gdb-syscalls.dtd
  rm -f ${pkgdir}/usr/share/gdb/syscalls/{i386,ppc64,amd64,ppc}-linux.xml
  rm -f ${pkgdir}/usr/lib/{libiberty,libbfd,libopcodes}.a
  rm -rf ${pkgdir}/usr/share/info/
}
