pkgname=mingw-w64-libnfc
pkgver=1.7.0
pkgrel=1
license=('LGPL')
arch=(any)
pkgdesc='libnfc is the first free NFC SDK and Programmers API (mingw-w64)'
url="http://nfc-tools.org"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-libusbx' 'mingw-w64-pcre' 'cmake')
options=('!libtool' '!strip')
source=("http://libnfc.googlecode.com/files/libnfc-1.7.0.tar.bz2")
md5sums=("8d8aced79cc0859c605c04d59e4484b3")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libnfc-$pkgver
  sed -i "s|PCRE_INCLUDE_DIRS regex.h|PCRE_INCLUDE_DIRS NAMES regex.h pcre.h|g" cmake/modules/FindPCRE.cmake
  
  sed -i "s|GET_CURRENT_YEAR(CURRENT_YEAR)|set(CURRENT_YEAR 2013)|g" CMakeLists.txt
  
  sed -i "s|lusb0_usb.h|libusb.h|g" libnfc/buses/usbbus.h
  for _arch in ${_architectures}; do
    unset LDFLAGS CFLAGS CPPFLAGS
    export PKG_CONFIG_LIBDIR=/usr/${_arch}/lib/pkgconfig/
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"

    cat <<EOF >toolchain-${_arch}.cmake
set ( CMAKE_SYSTEM_NAME Windows )
set ( CMAKE_C_COMPILER $_arch-gcc )
set ( CMAKE_CXX_COMPILER $_arch-g++ )
set ( CMAKE_RC_COMPILER $_arch-windres )
set ( CMAKE_FIND_ROOT_PATH /usr/$_arch )
set ( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
set ( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
set ( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
EOF

    cmake -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
          -DCMAKE_TOOLCHAIN_FILE=toolchain-${_arch}.cmake \
          -DPCRE_LIBRARIES=/usr/${_arch}/bin/libpcre-1.dll \
          -DLIBUSB_INCLUDE_DIRS=/usr/${_arch}/include/libusb-1.0 \
          -DLIBUSB_LIBRARIES=/usr/${_arch}/lib/libusb-1.0.dll.a \
          ..
#     make
    popd
  done
}

package() {
  cd libnfc-$pkgver
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
#     make install DESTDIR=$pkgdir
    popd
  done
}

