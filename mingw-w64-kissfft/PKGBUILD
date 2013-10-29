
pkgname=mingw-w64-kissfft
pkgver=1.3.0
pkgrel=1
pkgdesc="Fast Fourier Transform based up on the principle, Keep It Simple, Stupid. (mingw-w64)"
arch=('any')
url="http://kissfft.sourceforge.net/"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/project/kissfft/kissfft/v1_3_0/kiss_fft130.zip")
md5sums=('b91b85ca92001f4598e5a8c4bd476412')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/kiss_fft130"
  for _arch in $_architectures
  do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-gcc -o kiss_fft.o -c ../kiss_fft.c -fPIC
    ${_arch}-gcc -Wl,--out-implib,libkiss_fft.dll.a -shared -o libkiss_fft.dll kiss_fft.o
    popd
  done
}

package() {
  cd "$srcdir/kiss_fft130"
  for _arch in $_architectures
  do
    install -d "$pkgdir"/usr/${_arch}/include/ 
    install -m644 kissfft.hh kiss_fft.h "$pkgdir"/usr/${_arch}/include    
    pushd build-${_arch}
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m755 libkiss_fft.dll  "$pkgdir"/usr/${_arch}/bin/
    install -d "$pkgdir"/usr/${_arch}/lib
    install -m755 libkiss_fft.dll.a  "$pkgdir"/usr/${_arch}/lib/
    popd
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

