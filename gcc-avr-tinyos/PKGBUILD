# Maintainer: Andras Biro <bbandi86@gmail.com>
# Contributor: Andrea Fagiani <andfagiani_at_gmail_dot_com>
# PKGBUILD based on the gcc-avr PKGBUILD by 
#	Corrado Primier <bardo@aur.archlinux.org> and danst0 <danst0@west.de>

pkgname=gcc-avr-tinyos
pkgver=4.1.2
pkgrel=4
pkgdesc="The GNU avr Compiler Collection with TinyOS patches"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org/"
depends=('binutils-avr-tinyos' 'cloog' 'ppl' 'gcc-libs' 'libmpc')
provides=('gcc-avr')
options=('staticlibs' '!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=("http://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        "https://dl.dropboxusercontent.com/u/363226/munka/packages/arch/texinfo-4.13a-8-${CARCH}.pkg.tar.xz")
md5sums=('a4a3eb15c96030906d8494959eeda23c')
if test "${CARCH}" == x86_64; then
  md5sums+=('caf94ce15fa93789ab3e80e9eede64c5')
else
  md5sums+=('a11c55659fb041b8accd7aed06d777fa')
fi

build() {
  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  cd ${srcdir}
  svn checkout http://tinyos-main.googlecode.com/svn/trunk/packaging/old-toolchain/avr-gcc/patch/
  cd gcc-${pkgver}
  cat ../patch/*.patch|patch -p0

  export MAKEINFO=${srcdir}/usr/bin/makeinfo

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS" - credits to jck

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir build
  cd build
  ../configure --disable-libssp \
               --disable-nls \
               --enable-languages=c,c++ \
               --infodir=/usr/share/info \
               --libdir=/usr/lib \
               --libexecdir=/usr/lib \
               --mandir=/usr/share/man \
               --prefix=/usr \
               --target=avr \
               --with-gnu-as \
               --with-gnu-ld \
               --with-as=/usr/bin/avr-as \
               --with-ld=/usr/bin/avr-ld

  make || return 1
}

package() {
  cd ${srcdir}/gcc-${pkgver}

  cd build
  make -j1 DESTDIR=${pkgdir} install || return 1

  rm -f ${pkgdir}/usr/lib/libiberty.a || return 1
  rm -rf ${pkgdir}/usr/share/man/man7 || return 1
  rm -rf ${pkgdir}/usr/share/info || return 1
}

# vim:set ts=2 sw=2 et:
