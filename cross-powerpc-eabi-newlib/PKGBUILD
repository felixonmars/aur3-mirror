# $Id: $
# Maintainer: Tobias Sandmann <tSa *at* gmx *dot* eu>

_pkgname=newlib
pkgname=cross-powerpc-eabi-${_pkgname}
pkgver=1.17.0
pkgrel=1
pkgdesc="Cross compilation tools for PowerPC EABI - Newlib is a C library intended for use on embedded systems."
arch=(i686 x86_64)
license=('unknown')
url="http://sourceware.org/newlib/"
depends=()
groups=('cross-powerpc-eabi')
makedepends=('flex' 'cross-powerpc-eabi-binutils' 'cross-powerpc-eabi-gcc-4build')
options=('!libtool')
source=(ftp://sources.redhat.com/pub/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('9c345928b4f600a211ddc5a6072f8337')

_prefix=/opt/powerpc-eabi

build() {
  export PATH=$PATH:${_prefix}/bin

  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  unset MAKEFLAGS

  mkdir ${startdir}/src/build
  cd ${startdir}/src/build

  ${startdir}/src/${_pkgname}-${pkgver}/configure \
    --prefix=${_prefix} \
    --target=powerpc-eabi \
    || return 1

  make all || return 1
  make -j1 DESTDIR=${startdir}/pkg install || return 1

  rm -rf ${startdir}/pkg${_prefix}/info

  install -d ${startdir}/pkg${_prefix}/licenses/
  install -m 644 ${startdir}/src/${_pkgname}-${pkgver}/COPYING* ${startdir}/pkg${_prefix}/licenses/
}
