# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-gcc' by Andreas Messer <andi@surveycorner.de>

pkgname=cross-rx-elf-gdb
pkgver=7.1
pkgrel=1
pkgdesc="The GNU Debugger for Renesas RX target"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL3')
depends=('ncurses' 'expat' 'python')
makedepends=('texinfo')
optdepends=('openocd: for debugging jtag targets')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.bz2
        tui-no-gdbarch.patch)

md5sums=('21dce610476c054687b52770d2ddc657'
         'e2f3f6cb11d72e3727ed4f7c49ea395f')
build() {
  cd ${srcdir}/gdb-${pkgver}
  patch -Np1 -i $srcdir/tui-no-gdbarch.patch
  
  ./configure --prefix=/usr \
	--target=rx-elf \
	--host=$CHOST \
	--build=$CHOST \
	--disable-nls --with-system-readline \
	--with-local-prefix=/usr/lib/cross-rx \
	--with-sysroot=/usr/$CHOST/rx-elf

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # resolve conflicts with binutils / remove unneeded files
  rm -f ${pkgdir}/usr/include/{bfd,dis-asm,symcat,ansidecl,bfdlink}.h
  rm -f ${pkgdir}/usr/lib/{libiberty,libbfd,libopcodes}.a
  rm -rf ${pkgdir}/usr/share/info
  rm -f ${pkgdir}/usr/share/gdb/syscalls/gdb-syscalls.dtd
  rm -f ${pkgdir}/usr/share/gdb/syscalls/{i386,ppc64,amd64,ppc}-linux.xml
}
