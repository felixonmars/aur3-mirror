# Maintainer: Fernando Pacheco <fernando.pacheco@ingesur.com.uy>

pkgname=mingw-w64-uriparser
pkgver=0.7.7
pkgrel=1
arch=('any')
pkgdesc="MinGW Windows port of uriparser library (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags)
license=('BSD')
url="http://uriparser.sourceforge.net/"
source=("http://downloads.sourceforge.net/project/uriparser/Sources/${pkgver}/uriparser-${pkgver}.tar.bz2"
        "Toolchain.i686-w64-mingw32.cmake"
        "Toolchain.x86_64-w64-mingw32.cmake"
        "CMakeLists.txt"
        )
md5sums=('2da950ef006be5a842dcc383cbbeaa78'
         'b362ea0a3e87c2e4628414a91201aa14'
         'c2063886ce3e5a4322a4d348f9d7116f'
         '5a7e3bf19e2f145e1d96686aef0e93ba'
        )

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cp ../CMakeLists.txt ${srcdir}/uriparser-${pkgver}  
  cd ${srcdir}/uriparser-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    unset LDFLAGS
    cmake -DCMAKE_TOOLCHAIN_FILE=../../Toolchain.${_arch}.cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/${_arch} ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/uriparser-${pkgver}/build-${_arch}
    make DESTDIR=${pkgdir}/ install
    # ${_arch}-strip ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm -rf ${pkgdir}/usr/${_arch}/share/{doc,man}
    rm -rf ${pkgdir}/usr/${_arch}/{etc,var,libexec}
  done
}
