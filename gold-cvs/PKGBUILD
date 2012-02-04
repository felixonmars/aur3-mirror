# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>

pkgname=gold-cvs
pkgver=20100419
pkgrel=1
arch=(i686 x86_64)
pkgdesc="The Google Linker from GNU binutils, with plugin support"
url="http://www.gnu.org/software/binutils/"
license=(GPL)
depends=(gcc-libs glibc zlib)
makedepends=(cvs)

_cvsroot=":pserver:anoncvs@sourceware.org:/cvs/src"
_cvsmod="src"

build() {
  cd "$srcdir"
  msg "Connecting to sourceware.org CVS server...."
  cvs -z 9 -d $_cvsroot co -D $pkgver -f -l $_cvsmod
  cvs -z 9 -d $_cvsroot co -D $pkgver -f \
    $_cvsmod/{bfd,config,cpu,elfcpp,etc,gold,include,intl,libiberty,opcodes,texinfo}
  msg "CVS checkout done or server timeout"
  
  rm -rf $_cvsmod-build
  mkdir $_cvsmod-build
  cd $_cvsmod-build

  export ERROR_ON_WARNING=no

  msg "Starting configure..."
  ../$_cvsmod/configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --enable-gold \
    --enable-threads \
    --enable-plugins \
    --enable-64-bit-bfd \
    --enable-targets=all || return 1

  msg "Starting make..."
  make all-gold || return 1
}

package() {
  cd "$srcdir/$_cvsmod-build"

  make prefix="$pkgdir/usr" tooldir="$pkgdir/usr" install-gold || return 1

  # ld plugin API (e.g. for LLVM link-time optimization)
  install -m644 -D "$srcdir/$_cvsmod/include/plugin-api.h" "$pkgdir/usr/include/plugin-api.h"

  # Rename ld to gold
  mv "$pkgdir"/usr/bin/{ld,gold}
}
