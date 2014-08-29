# $Id: PKGBUILD 213136 2014-05-19 14:16:08Z svenstaro $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=nmingw-w64-openexr
pkgver=2.1.0
pkgrel=1
pkgdesc="An high dynamic-range image file format library (mingw-w64)"
url="http://www.openexr.com/"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-ilmbase')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!buildflags' '!strip')
source=("http://download.savannah.nongnu.org/releases/openexr/openexr-${pkgver}.tar.gz"
       openexr-2.1.0-headers.patch
       openexr-2.1.0_bb44ExpLogTable.patch
       openexr-2.1.0_aligned-malloc.patch
       openexr-2.1.0_cast.patch
       openexr_obsolete-macros.patch)
md5sums=('33735d37d2ee01c6d8fbd0df94fb8b43' SKIP SKIP SKIP SKIP SKIP)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/openexr-${pkgver}"
  # fedora patches
  #patch -p1 -i "${srcdir}"/openexr-2.1.0-headers.patch
  #patch -p1 -i "${srcdir}"/openexr-2.1.0_bb44ExpLogTable.patch
  #patch -p1 -i "${srcdir}"/openexr-2.1.0_aligned-malloc.patch
  #patch -p1 -i "${srcdir}"/openexr-2.1.0_cast.patch
  #patch -p1 -i "${srcdir}"/openexr_obsolete-macros.patch
}

build() {
  cd "${srcdir}/openexr-${pkgver}"
  ./bootstrap
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch} \
  
    make
    popd
  done
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
