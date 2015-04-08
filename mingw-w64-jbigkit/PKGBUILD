pkgname=mingw-w64-jbigkit
pkgver=2.1
pkgrel=1
pkgdesc="Data compression library for bi-level high-resolution images (mingw-w64)"
arch=(any)
url="http://www.cl.cam.ac.uk/~mgk25/jbigkit/"
license=("GPL")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)
options=(!strip !buildflags staticlibs)
source=("http://www.cl.cam.ac.uk/~mgk25/download/jbigkit-$pkgver.tar.gz")
md5sums=('ebcf09bed9f14d7fa188d3bd57349522')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	for _arch in $_architectures; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    cp -r ../jbigkit-$pkgver/* .
    find . -name 'Makefile' -exec sed -i "s,ar rc,${_arch}-ar rc,g" {} \;
    find . -name 'Makefile' -exec sed -i "s,-ranlib,${_arch}-ranlib,g" {} \;
    popd
  done
}

build() {
  for _arch in $_architectures; do
    pushd build-${_arch}
		make CC=${_arch}-gcc
    popd
  done
}

package() {
  for _arch in $_architectures; do
    pushd build-${_arch}
		install -Dm644 libjbig/libjbig.a "$pkgdir/usr/${_arch}/lib/libjbig.a"
		install -m644 libjbig/libjbig85.a "$pkgdir/usr/${_arch}/lib/libjbig85.a"
		install -Dm644 libjbig/jbig.h "$pkgdir/usr/${_arch}/include/jbig.h"
		install -m644 libjbig/jbig_ar.h "$pkgdir/usr/${_arch}/include/jbig_ar.h"
		install -m644 libjbig/jbig85.h "$pkgdir/usr/${_arch}/include/jbig85.h"
    popd
    find "$pkgdir/usr/${_arch}" -name '*.a' -exec ${_arch}-strip -g {} \;
  done
}

