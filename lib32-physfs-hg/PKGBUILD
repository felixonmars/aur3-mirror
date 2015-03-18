# Maintainer: edubart <edub4rt@gmail.com>
_pkgbasename=physfs
pkgname=lib32-physfs-hg
pkgver=17032015
pkgrel=3
pkgdesc="A library to provide abstract access to various archives"
arch=('x86_64')
url="http://icculus.org/physfs/"
license=('ZLIB')
depends=('lib32-zlib' 'mercurial')
provides=(lib32-physfs)
conflicts=(lib32-physfs)
makedepends=('cmake')
source=('hg+http://hg.icculus.org/icculus/physfs')
sha1sums=('SKIP')
provides=(lib32-physfs)
conflicts=(lib32-physfs)

prepare() {
  cd physfs
  sed -i 's/-Werror//' CMakeLists.txt
}

build() {
  cd physfs
  mkdir -p build
  cd build
  export CFLAGS="$CFLAGS -m32 -fno-strict-aliasing"
  export CXXFLAGS="$CXXFLAGS -m32 -fno-strict-aliasing"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_LIBRARY_PATH=/usr/lib32 \
    -DPHYSFS_BUILD_TEST=OFF \
    -DPHYSFS_BUILD_WX_TEST=OFF \
    -DLIB_SUFFIX=32
  make
}

package() {
  cd physfs
  make -C build DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir"/usr/{include,share,lib}
}


