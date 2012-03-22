# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-binutils' by Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=cross-sh3eb-elf-binutils
pkgver=2.22
pkgrel=1
_xprefix=/usr
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=(i686 x86_64)
license=(GPL)
options=(!libtool)
url="http://sources.redhat.com/binutils"
depends=('glibc' 'zlib')
source=(http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
md5sums=('ee0f10756c84979622b992a4a61ea3f5')

build() {
  cd $srcdir/binutils-${pkgver}

  [ $NOEXTRACT -eq 1 ] || ./configure --prefix=${_xprefix} \
	--program-prefix=sh3eb-elf- \
	--enable-shared \
	--disable-multilib \
	--with-lib-path=${_xprefix}/lib/binutils/sh3eb-elf \
	--disable-nls \
	--target=sh3eb-elf \
	--host=$CHOST \
	--build=$CHOST \

#  mkdir -p $pkgdir/${_xprefix}/lib/binutils
#  sed -i 's|know (S_GET_VALUE (frag->tc_frag_data.last_map) < S_GET_VALUE (symbolP));|{know (S_GET_VALUE (frag->tc_frag_data.last_map) < S_GET_VALUE (symbolP));}|' gas/config/tc-arm.c || return 1

  make configure-host || return 1
  make tooldir=$pkgdir/${_xprefix} || return 1
  make prefix=$pkgdir/${_xprefix} tooldir=$pkgdir/${_xprefix} install || return 1

  mkdir -p $pkgdir/${_xprefix}/lib/binutils/sh3eb-elf
  cp -v include/libiberty.h $pkgdir/${_xprefix}/lib/binutils/sh3eb-elf

  rm -f $pkgdir/${_xprefix}/man/man1/{dlltool,nlmconv,windres}* || return 1

  rm -f $pkgdir/usr/bin/ar || return 1
  rm -f $pkgdir/usr/bin/as || return 1
  rm -f $pkgdir/usr/bin/ld || return 1
  rm -f $pkgdir/usr/bin/nm || return 1
  rm -f $pkgdir/usr/bin/objdump || return 1
  rm -f $pkgdir/usr/bin/ranlib || return 1
  rm -f $pkgdir/usr/bin/strip || return 1
  rm -f $pkgdir/usr/bin/objcopy || return 1
  rm -f $pkgdir/usr/lib/libiberty.a || return 1
  rm -rf $pkgdir/usr/share
  rm -rf $pkgdir/usr/lib/ldscripts
}
