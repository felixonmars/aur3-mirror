# Contributor: Michael Egger <gcarq at-symbol archlinux . info>

_target="mipsel-linux-gnu"
pkgbase=${_target}-binutils
pkgname=(${_target}-binutils-ldscripts ${_target}-binutils)
pkgver=2.24
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the MIPS architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('zlib')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
md5sums=(SKIP)

prepare() {
  cd binutils-${pkgver}

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  rm -rf "${srcdir}"/binutils-${pkgver}-build
  mkdir -p "${srcdir}"/binutils-${pkgver}-build
}


build() {

  cd binutils-${pkgver}-build

  ../binutils-${pkgver}/configure CFLAGS='-Os -msoft-float' \
              --prefix=/usr \
              --with-lib-path=/usr/lib/binutils/${_target} \
              --program-prefix=${_target}- \
              --enable-shared \
              --disable-multilib \
              --with-local-prefix=/usr/lib/${_target} \
              --with-sysroot=/usr/${_target} \
              --disable-nls \
              --target=${_target} \
              --host=$CHOST \
              --build=$CHOST \
              --disable-werror \
              --enable-softfloat \
              --with-float=soft

  make configure-host
  make tooldir=/usr

  local pkgdir="${srcdir}/pkg"
  rm -rf "$pkgdir"

  make prefix="$pkgdir/usr" tooldir="$pkgdir/usr" install

  rm -f "$pkgdir"/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip,objcopy}
  rm -f "$pkgdir"/usr/lib/libiberty.a
  rm -rf "$pkgdir"/usr/{share,man}
}

package_mipsel-linux-gnu-binutils-ldscripts() {
  mkdir -p "$pkgdir/usr/lib/"
  cp -a pkg/usr/lib/ldscripts "$pkgdir/usr/lib/"
}

package_mipsel-linux-gnu-binutils() {
  depends+=(${_target}-binutils-ldscripts)
  cp -a pkg/usr "$pkgdir/"
  rm -rf "$pkgdir/usr/lib/ldscripts"
}
