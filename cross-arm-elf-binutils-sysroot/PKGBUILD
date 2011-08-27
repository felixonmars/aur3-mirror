# Taken from croos-arm-elf-binutils
# Maintainer: Andreas Messer <andi@surveycorner.de>

pkgname=cross-arm-elf-binutils-sysroot
pkgver=2.20.1
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (with sysroot support)"
arch=(i686 x86_64)
license=(GPL)
options=(!libtool)
url="http://sources.redhat.com/binutils"
depends=('glibc')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.gz)
conflicts=('cross-arm-elf-binutils')
provides=("cross-arm-elf-binutils=${pkgver}")
_prefix=/usr
md5sums=('eccf0f9bc62864b29329e3302c88a228')

build() {
  cd ${startdir}/src/binutils-${pkgver}

  [ $NOEXTRACT -eq 1 ] || ./configure --prefix=$_prefix \
	--program-prefix=arm-elf- \
	--enable-shared \
	--disable-multilib \
	--with-lib-path=$_prefix/lib/binutils/arm-elf \
	--disable-nls \
	--target=arm-elf \
	--host=$CHOST \
	--build=$CHOST \
  --with-sysroot=/usr/$CHOST/arm-elf

  sed -i 's|know (S_GET_VALUE (frag->tc_frag_data.last_map) < S_GET_VALUE (symbolP));|{know (S_GET_VALUE (frag->tc_frag_data.last_map) < S_GET_VALUE (symbolP));}|' gas/config/tc-arm.c || return 1

  make configure-host || return 1
  make tooldir=${startdir}/pkg/$_prefix || return 1
  make prefix=${startdir}/pkg/$_prefix tooldir=${startdir}/pkg/$_prefix install || return 1

  mkdir -p                  ${startdir}/pkg/${_prefix}/lib/binutils/arm-elf
  cp -v include/libiberty.h ${startdir}/pkg/${_prefix}/lib/binutils/arm-elf

  rm -f ${startdir}/pkg/$_prefix/man/man1/{dlltool,nlmconv,windres}* || return 1

  rm -f $startdir/pkg/usr/bin/ar || return 1
  rm -f $startdir/pkg/usr/bin/as || return 1
  rm -f $startdir/pkg/usr/bin/ld || return 1
  rm -f $startdir/pkg/usr/bin/nm || return 1
  rm -f $startdir/pkg/usr/bin/objdump || return 1
  rm -f $startdir/pkg/usr/bin/ranlib || return 1
  rm -f $startdir/pkg/usr/bin/strip || return 1
  rm -f $startdir/pkg/usr/bin/objcopy || return 1
  rm -f $startdir/pkg/usr/lib/libiberty.a || return 1
  rm -rf $startdir/pkg/usr/share
}
