
pkgname=mingw-w64-poco
pkgver=1.6.0
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, complete edition (mingw-w64)"
arch=('any')
url="http://www.pocoproject.org/"
license=('custom:boost')
depends=('mingw-w64-libmariadbclient' 'mingw-w64-openssl')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://pocoproject.org/releases/poco-${pkgver}/poco-${pkgver}-all.tar.gz"
poco-pr652.patch::https://github.com/xantares/poco/commit/345481a4754e8d26e6a1cc06035db4e566ec9fa0.patch
poco-pr653.patch::https://github.com/xantares/poco/commit/bf929f97043c2b907929c2ef13775a4fe3454504.patch
poco-pr654.patch::https://github.com/pocoproject/poco/commit/1e28368222f5dcbc7a84bfba6f58daaef2ebef1a.patch)
sha256sums=('ed1be29ee413141269e7ccee861b11a2992a9f70072dbb28bec31ad432d71cab' 'SKIP' 'SKIP' 'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/poco-${pkgver}-all"
  patch -p1 -i ../poco-pr652.patch
  patch -p1 -i ../poco-pr653.patch
  patch -p1 -i ../poco-pr654.patch

  # see PR #651
  sed -i "s| -mno-cygwin||g" CMakeLists.txt
  sed -i "s| -DFoundation_Config_INCLUDED||g" CMakeLists.txt
}


build()
{
  cd "${srcdir}/poco-${pkgver}-all"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DENABLE_PAGECOMPILER_FILE2PAGE=OFF -DENABLE_PAGECOMPILER=OFF ..
    make
    popd
  done
}

package()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/poco-${pkgver}-all/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
