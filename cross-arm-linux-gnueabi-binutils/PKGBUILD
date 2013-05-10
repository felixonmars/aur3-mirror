# Maintainer: Chuan Ji <jichuan89@gmail.com>

_target=arm-linux-gnueabi
pkgname=cross-${_target}-binutils
pkgver=2.23.2
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=(i686 x86_64)
license=(GPL)
options=('!libtool' '!buildflags')
url="http://sources.redhat.com/binutils"
depends=('glibc')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
md5sums=('4f8fa651e35ef262edc01d60fb45702e')

build() {
  cd $srcdir/binutils-${pkgver}

  [ $NOEXTRACT -eq 1 ] || ./configure --prefix=/usr \
        --program-prefix=${_target}- \
        --enable-shared \
        --disable-multilib \
        --with-lib-path=/usr/lib/binutils/${_target} \
        --with-local-prefix=/usr/lib/${_target} \
        --disable-nls \
        --target=${_target} \
        --host=$CHOST \
        --build=$CHOST \
        --with-sysroot=/usr/$CHOST/${_target} \
        --disable-werror

  make configure-host
  make tooldir=$pkgdir/usr
}

package() {
  cd $srcdir/binutils-${pkgver}

  make DESTDIR="$pkgdir/" install
  make prefix=$pkgdir/usr tooldir=$pkgdir/usr install

  mkdir -p $pkgdir/usr/lib/binutils/${_target}
  cp -v include/libiberty.h $pkgdir/usr/lib/binutils/${_target}
  cp -v include/demangle.h $pkgdir/usr/lib/binutils/${_target}

  rm -f $pkgdir/usr/man/man1/{dlltool,nlmconv,windres,windmc}*
  rm ${pkgdir}/usr/share/info/{configure,standards}.info

  rm -f $pkgdir/usr/bin/ar
  rm -f $pkgdir/usr/bin/as
  rm -f $pkgdir/usr/bin/ld
  rm -f $pkgdir/usr/bin/nm
  rm -f $pkgdir/usr/bin/objdump
  rm -f $pkgdir/usr/bin/ranlib
  rm -f $pkgdir/usr/bin/strip
  rm -f $pkgdir/usr/bin/objcopy
  rm -f $pkgdir/usr/lib/libiberty.a
  rm -rf $pkgdir/usr/share
  rm -f ${pkgdir}/usr/lib/lib{bfd,opcodes}.so
}
