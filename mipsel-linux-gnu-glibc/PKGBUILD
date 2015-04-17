# Contributor: Michael Egger <gcarq at-symbol archlinux . info>

_target="mipsel-linux-gnu"
pkgname=${_target}-glibc
pkgver=2.21
pkgrel=3
pkgdesc="GNU C Library (${_target})"
arch=(any)
url="http://www.gnu.org/software/libc"
license=('GPL' 'LGPL')
depends=("${_target}-linux-api-headers")
makedepends=("${_target}-gcc-stage2" 'subversion' 'gperf')
provides=("${_target}-eglibc=${pkgver}" "${_target}-glibc-headers=${pkgver}")
conflicts=("${_target}-eglibc" "${_target}-glibc-headers")
replaces=("${_target}-eglibc" "${_target}-glibc-headers")
options=(!strip 'staticlibs')
source=(http://ftp.gnu.org/gnu/libc/glibc-${pkgver}.tar.xz)
md5sums=('9cb398828e8f84f57d1f7d5588cf40cd')

prepare() {
  cd glibc-${pkgver}

  rm -rf "${srcdir}"/glibc-build
  mkdir -p "${srcdir}"/glibc-build
}

build() {
  cd glibc-${pkgver}
  
  # Don not build timezones
  sed -i 's/timezone rt/rt/' Makeconfig

  cd "${srcdir}"/glibc-build

  export CFLAGS="-U_FORTIFY_SOURCE -msoft-float -O2"
  export CPPFLAGS="-U_FORTIFY_SOURCE -O2"
  unset LD_LIBRARY_PATH

  export BUILD_CC=gcc
  export CC=${_target}-gcc
  export CXX=${_target}-g++
  export AR=${_target}-ar
  export RANLIB=${_target}-ranlib

  ../glibc-${pkgver}/configure CFLAGS='-Os -msoft-float' \
    --prefix=/ \
    --target=${_target} \
    --host=${_target} \
    --build=${CHOST} \
    --with-headers=/usr/${_target}/include \
    --enable-obsolete-rpc \
    --enable-kernel=2.6.32 \
    --enable-bind-now \
    --disable-profile \
    --disable-libssp \
    --disable-libquadmath \
    --enable-stackguard-randomization \
    --enable-lock-elision \
    --enable-shared \
    --with-tls \
    --with-__thread \
    --without-cvs \
    --without-gd \
    --disable-werror \
    --enable-softfloat \
    --with-float=soft \
    --without-fp

  make
}

package() {
  cd glibc-build

  make "install_root=${pkgdir}/usr/${_target}" install

  mkdir -p "${pkgdir}/usr/${_target}/usr"
  ln -s ../{include,lib} "${pkgdir}/usr/${_target}/usr"
  # Remove unneeded for compilation files
  rm -rf "${pkgdir}"/usr/${_target}/{bin,sbin,etc,share,var}

  for f in "${pkgdir}"/usr/${_target}/lib/lib{c,pthread}.so; do
    sed -i "$f" -e "s://lib/l:l:g"
  done
}
