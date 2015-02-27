pkgname=mingw-w64-plibc
pkgver=0.1.7.r147
pkgrel=2
pkgdesc="A POSIX compliant libc for Windows (mingw-w64)"
arch=(any)
url="http://plibc.sourceforge.net/"
license=('LGPL')
makedepends=(dos2unix mingw-w64-configure subversion)
depends=(mingw-w64-crt)
options=(!strip !buildflags !staticlibs)
source=('svn+https://svn.code.sf.net/p/plibc/code/trunk/plibc#revision=147'
        'plibc-mingw-include.patch')
md5sums=('SKIP'
         'd9e3ad067957022b39c89fa86d39120a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/plibc"
  local ver="$(svnversion)"
  printf "0.1.7.r%s" "${ver//[[:alpha:]]}"
}

prepare(){
  cd "${srcdir}/plibc"
  svn revert * -R
  patch -p2 -i ../plibc-mingw-include.patch
}

build() {
  cd "${srcdir}/plibc"

  export CPPFLAGS="$CPPFLAGS -DHAVE_DECL_GETADDRINFO -DHAVE_DECL_GETNAMEINFO -DHAVE_DECL_FREEADDRINFO"
  sh ./bootstrap

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/plibc/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
