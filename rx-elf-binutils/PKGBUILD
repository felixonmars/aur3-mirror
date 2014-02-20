# Maintainer: Peter Marheine <peter@taricorp.net>
# based on 'cross-arm-elf-binutils' by Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=rx-elf-binutils
pkgver=2.24
pkgrel=1
_xprefix=/usr
pkgdesc="A set of programs to assemble and manipulate binary and object files (Renesas RX target)"
arch=(i686 x86_64)
license=(GPL)
options=(!libtool)
url="http://sources.redhat.com/binutils"
depends=('glibc' 'zlib')
source=(http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
md5sums=('e0f71a7b2ddab0f8612336ac81d9636b')
sha1sums=('7ac75404ddb3c4910c7594b51ddfc76d4693debb')
sha512sums=('5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12')

build() {
  cd $srcdir/binutils-${pkgver}

  [ $NOEXTRACT -eq 1 ] || ./configure --prefix=${_xprefix} \
	--program-prefix=rx-elf- \
	--enable-shared \
	--disable-multilib \
	--with-lib-path=${_xprefix}/lib/binutils/rx-elf \
	--disable-nls \
	--target=rx-elf \
	--host=$CHOST \
	--build=$CHOST \

#  mkdir -p $pkgdir/${_xprefix}/lib/binutils
#  sed -i 's|know (S_GET_VALUE (frag->tc_frag_data.last_map) < S_GET_VALUE (symbolP));|{know (S_GET_VALUE (frag->tc_frag_data.last_map) < S_GET_VALUE (symbolP));}|' gas/config/tc-arm.c || return 1

  make configure-host || return 1
  make tooldir=$pkgdir/${_xprefix} || return 1
  make prefix=$pkgdir/${_xprefix} tooldir=$pkgdir/${_xprefix} install || return 1

  mkdir -p $pkgdir/${_xprefix}/lib/binutils/rx-elf
  cp -v include/libiberty.h $pkgdir/${_xprefix}/lib/binutils/rx-elf

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
