
pkgname=mingw-w64-cfitsio
pkgver=3.370
pkgrel=1
pkgdesc="A library of C and Fortran subroutines for reading and writing data files in FITS (Flexible Image Transport System) data format (mingw-w64)"
arch=('any')
url="http://heasarc.gsfc.nasa.gov/fitsio/"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
source=("ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/cfitsio${pkgver/./}.tar.gz")
sha512sums=('97c820757513ac0c59c277b39b8f8a6d1cbc1b2d37ca8ee68d645533a37d25fcdba87e676eaaf3cfa557c34591e9476326d892e0f8c42d3e1372e1d6a4406d18')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir" 
  for _arch in ${_architectures}; do
    cp -r cfitsio build-${_arch} && pushd build-${_arch}
    CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
    ./configure --prefix=/usr/${_arch} --host=${_arch}
    make shared SHLIB_SUFFIX=".dll" SHLIB_LD="${_arch}-gcc -shared -Wl,--out-implib,libcfitsio.dll.a" 
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir"/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
