# $Id: $
# Maintainer: Tobias Sandmann <tSa *at* gmx *dot* eu>

_pkgname=binutils
pkgname=cross-powerpc-eabi-${_pkgname}
pkgver=2.19.1
pkgrel=1
pkgdesc="Cross compilation tools for PowerPC EABI - A set of programs to assemble and manipulate binary and object files"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnu.org/software/binutils/"
groups=('cross-powerpc-eabi')
depends=('zlib')
makedepends=()
options=('!libtool')
source=(ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('09a8c5821a2dfdbb20665bc0bd680791')

_prefix=/opt/powerpc-eabi

build() {
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  unset MAKEFLAGS

  mkdir -p ${startdir}/src/build
  cd ${startdir}/src/build

  CC="gcc -L${startdir}/src/build/bfd/.libs/"
  if [ "${CARCH}" = "x86_64" ]; then
    ${startdir}/src/${_pkgname}-${pkgver}/configure \
      --prefix=${_prefix} \
      --infodir=${_prefix}/info \
      --mandir=${_prefix}/man \
      --target=powerpc-eabi \
      --enable-shared \
      --disable-nls \
      --with-gcc \
      --with-gnu-as \
      --with-gnu-ld \
      --disable-multilib \
      --enable-64-bit-bfd \
      || return 1
  else
    ${startdir}/src/${_pkgname}-${pkgver}/configure \
      --prefix=${_prefix} \
      --infodir=${_prefix}/info \
      --mandir=${_prefix}/man \
      --target=powerpc-eabi \
      --enable-shared \
      --disable-nls \
      --with-gcc \
      --with-gnu-as \
      --with-gnu-ld \
      || return 1
  fi

  # This checks the host environment and makes sure all the necessary tools are available to compile Binutils.
  make configure-host || return 1

  make || return 1
  make DESTDIR=${startdir}/pkg install || retrun 1
  install -D -m 644 ${startdir}/src/${_pkgname}-${pkgver}/include/libiberty.h ${startdir}/pkg${_prefix}/include/libiberty.h

  if [ "${CARCH}" = "x86_64" ]; then
    # Rebuild libiberty.a with -fPIC
    make -C libiberty clean
    make CFLAGS="$CFLAGS -fPIC" -C libiberty
    install -m 644 libiberty/libiberty.a ${startdir}/pkg${_prefix}/lib
    # Rebuild libbfd.a with -fPIC
    make -C bfd clean
    make CFLAGS="$CFLAGS -fPIC" -C bfd
    install -m 644 bfd/libbfd.a ${startdir}/pkg${_prefix}/lib
  fi

  rm ${startdir}/pkg${_prefix}/info/dir
  gzip -9 ${startdir}/pkg${_prefix}/info/*

  rm -f ${startdir}/pkg${_prefix}/man/man1/{dlltool,nlmconv,windres,windmc}*
}
