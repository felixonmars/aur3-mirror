# Contributor: SebRmv <sbriais at-symbol free dot fr> 
pkgname=mintlib-cvs
#pkgver=`date +%Y.%m.%d`
pkgver=2013.11.27
pkgrel=1
pkgdesc="MiNTLib is a standard C library usable to build software which runs on MiNT and TOS operating systems"
arch=('i686' 'x86_64')
url="http://sparemint.org/cgi-bin/cvsweb/mintlib/"
license=('COPYMINT')
#license=('COPYMINT' 'LGPL' 'BSD' "Henry Spencer's license" "musl's license")
groups=()
depends=()
makedepends=('cvs' 'cross-m68k-atari-mint-binutils' 'cross-m68k-atari-mint-gcc-core')
provides=()
conflicts=()
replaces=()
backup=()
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip' 'staticlibs')
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_cvsroot=:pserver:cvsanon:cvsanon@sparemint.org:/mint
_cvsmod=mintlib

build() {
  cd "${srcdir}"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/$_cvsmod-build"
  cp -r "${srcdir}/$_cvsmod" "${srcdir}/$_cvsmod-build"
  cd "${srcdir}/$_cvsmod-build"

  # #
  # # BUILD HERE
  # #

  sed -i "s:^\( prefix=\)/usr/m68k-atari-mint.*:\1${pkgdir}/usr/lib/cross-m68k-atari-mint/m68k-atari-mint/:g" configvars
  sed -i "s:^#CROSS=yes$:CROSS=yes:g" configvars

  make
}

package() {
  cd "${srcdir}/$_cvsmod-build"
  make DESTDIR="${pkgdir}/usr/lib/cross-m68k-atari-mint/m68k-atari-mint/" install

  rm -rf "${pkgdir}/usr/lib/cross-m68k-atari-mint/m68k-atari-mint/share"
  find "${pkgdir}/usr/lib/cross-m68k-atari-mint/m68k-atari-mint/lib" '(' -name '*.a' -o -name '*.o' ')' -print -exec m68k-atari-mint-strip -S -x '{}' ';'
}

# vim:set ts=2 sw=2 et:
