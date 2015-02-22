
pkgname=mingw-w64-dcmtk
pkgver=3.6.1_20150217
pkgrel=1
pkgdesc="a collection of libraries and applications implementing large parts the DICOM standard (mingw-w64)"
arch=('any')
url="http://dicom.offis.de/dcmtk"
license=('BSD')
depends=('mingw-w64-zlib' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-libxml2' 'mingw-w64-openssl' 'mingw-w64-libsndfile')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://dicom.offis.de/download/dcmtk/snapshot/dcmtk-${pkgver}.tar.gz")
md5sums=('84385af09ee19c4208e6373469e2058d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/dcmtk-${pkgver}"

  # lib names are hardcoded
  sed -i "s|libxml2_o.lib|libxml2.dll.a|g" CMake/3rdparty.cmake
  sed -i "s|/iconv_o.lib|/libiconv.dll.a|g" CMake/3rdparty.cmake
  sed -i "s|libiconv_o.lib|libiconv.dll.a|g" CMake/3rdparty.cmake
  sed -i "s|libpng_o.lib|libpng.dll.a|g" CMake/3rdparty.cmake
  sed -i "s|libtiff_o.lib|libtiff.dll.a|g" CMake/3rdparty.cmake
  sed -i "s|dcmtkssl_o.lib|libssl.dll.a|g" CMake/3rdparty.cmake
#   sed -i "s|dcmtkeay_d.lib||g" CMake/3rdparty.cmake
#   sed -i "s|dcmtkeay_o.lib||g" CMake/3rdparty.cmake
  sed -i "s|libsndfile_o.lib|libsndfile.dll.a|g" CMake/3rdparty.cmake
  sed -i "s|zlib_o.lib|libz.dll.a|g" CMake/3rdparty.cmake

  # libxml2 includes are installed in a subdir
  sed -i "s|SET(LIBXML_INCDIR \${WITH_LIBXMLINC}/include)|SET(LIBXML_INCDIR \${WITH_LIBXMLINC}/include/libxml2)|g" CMake/3rdparty.cmake
}

build() {
  cd "${srcdir}/dcmtk-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE:STRING="Release" \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DDCMTK_WITH_PRIVATE_TAGS:BOOL=ON \
      -DDCMTK_WITH_OPENSSL:BOOL=OFF \
      -DWITH_OPENSSLINC=/usr/${_arch} \
      -DDCMTK_WITH_PNG:BOOL=ON \
      -DWITH_LIBPNGINC=/usr/${_arch} \
      -DDCMTK_WITH_TIFF:BOOL=ON \
      -DWITH_LIBTIFFINC=/usr/${_arch} \
      -DDCMTK_WITH_XML:BOOL=ON \
      -DWITH_LIBXMLINC=/usr/${_arch} \
      -DDCMTK_WITH_CHARLS=OFF \
      -DDCMTK_WITH_ZLIB:BOOL=ON \
      -DWITH_ZLIBINC=/usr/${_arch} \
      -DDCMTK_WITH_LIBICONV:BOOL=ON \
      -DWITH_LIBICONVINC=/usr/${_arch} \
      -DDCMTK_WITH_SNDFILE=ON \
      -DWITH_SNDFILEINC=/usr/${_arch} \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/dcmtk-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}