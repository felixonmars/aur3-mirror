pkgname=bgcc
pkgver=4.0.2
pkgrel=1
pkgdesc="This package adds full, fine-grained array bounds and pointer checking to GCC (C only)"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://sourceforge.net/projects/boundschecking/"
depends=('binutils>=2.18-3' 'mpfr>=2.3.1')
makedepends=('texinfo')
options=('!libtool')
# {core,g++,fortran,objc,java}-

_prefix="/opt/bgcc"

_thepatch=bounds-checking-gcc-${pkgver}-1.00.patch
_thepatchurl=http://downloads.sourceforge.net/project/boundschecking/gcc-${pkgver}/gcc-${pkgver}/bounds-checking-gcc-${pkgver}-1.00.patch.bz2

#_thepatch=gcc-${pkgver}-bgcc-${pkgver}.pat
#_thepatchurl=http://williambader.com/bounds/gcc-${pkgver}-bgcc-${pkgver}.pat.bz2

source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
        $_thepatchurl
        )

build() {

  unset CFLAGS # fixes compile error

  rm -rf "gcc-${pkgver}_patched"
  # patch creates new files, need to move
  mv "gcc-${pkgver}" "gcc-${pkgver}_patched"
  cd "gcc-${pkgver}_patched"

  patch -Np1 -i "${srcdir}/$_thepatch"

  rm -rf "${srcdir}/build"
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  # unset LD_ to fix:
  # /usr/lib/gcc/x86_64-unknown-linux-gnu/4.6.3/cc1: build/gcc/libgcc_s.so.1: version `GCC_4.2.0' not found
  # (required by /usr/lib/libstdc++.so.6)
  CC="env -u LD_LIBRARY_PATH -u LD_PRELOAD ${CC-cc}" \
    CXX="env -u LD_LIBRARY_PATH -u LD_PRELOAD ${CXX-c++}" \
    ${srcdir}/gcc-${pkgver}_patched/configure \
      --prefix="$_prefix" \
      --libdir="$_prefix/lib" --libexecdir="$_prefix/lib" \
      --disable-multilib --enable-languages=c

  make

  make -j1 DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/bin"

  ln -sf "../..${_prefix}/bin/gcc" "${pkgdir}/usr/bin/bgcc"

}
md5sums=('a659b8388cac9db2b13e056e574ceeb0'
         'e1deb50aababdffe7d46bfffa1725546')
