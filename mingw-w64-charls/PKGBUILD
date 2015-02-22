
pkgname=mingw-w64-charls
pkgver=1.0
# Some Fedora version info (for patches)
_fedora_rel=2.fc15
pkgrel=1
pkgdesc="An optimized implementation of the JPEG-LS standard (mingw-w64)"
arch=('any')
url="http://charls.codeplex.com/"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'dos2unix')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://kojipkgs.fedoraproject.org/packages/CharLS/${pkgver}/${_fedora_rel}/src/CharLS-${pkgver}-${_fedora_rel}.src.rpm")
sha512sums=('7fbf1f2e5c0f7333ad6e007fd7cc2e29707a1a461498f7c323971bafcff9840300805b2f42af72f7066a26572eb9c5f4fe846c8d79504c603ab69ff61a5529b2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  # Use sources for Fedora RPM because the CodePlex website requires interaction to download
  mkdir -p CharLS-${pkgver} && pushd CharLS-${pkgver}
  bsdtar -xf "${srcdir}"/CharLS-source-${pkgver}.zip

  # Remove Microsoft Visual Studio project files
  rm CharLS.vcproj
  rm CharLS.sln

  # Convert files to Unix line endings ('\r\n' -> '\n')
  dos2unix *.h
  dos2unix *.c*
  dos2unix *.txt

  # Apply Fedora patches
  for i in $(grep "Patch[0-9]*:" ../CharLS.spec | awk '{ print $2 }'); do
    patch -p1 -i "../${i}"
  done

  sed -i "s|LIBRARY DESTINATION|RUNTIME DESTINATION bin ARCHIVE DESTINATION lib\${LIB_SUFFIX} LIBRARY DESTINATION|g" CMakeLists.txt
  sed -i "s|IF(BUILD_SHARED_LIBS)|IF(1)|g" CMakeLists.txt
  sed -i "s|CharLS SHARED|CharLS|g" CMakeLists.txt
  sed -i "/charlstest/d" CMakeLists.txt
}

build() {
  cd "${srcdir}/CharLS-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE:STRING="Release" \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -Dcharls_BUILD_SHARED_LIBS=ON \
      -DCMAKE_BUILD_TYPE:STRING="Release" \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/CharLS-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/CharLS-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

