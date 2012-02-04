pkgname=lib32-box2d
pkgver=2.2.1
pkgrel=1
pkgdesc="2D rigid body simulation library for games"
url="http://www.box2d.org/"
license=('zlib')
arch=('x86_64')
makedepends=('cmake')
optdepends=()
source=(http://box2d.googlecode.com/files/Box2D_v${pkgver}.zip)
md5sums=('9e9d32a34fb5554c47f0f9cade0fa611')

build() {
  cd ${srcdir}/Box2D_v${pkgver}

  msg "Starting build"
  [[ -d build ]] && rm -r build
  mkdir build && cd build

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cmake .. \
    -DLIB_SUFFIX=32 \
    -DLIB_INSTALL_DIR=/usr/lib32 \
    -DBOX2D_INSTALL=ON \
    -DBOX2D_BUILD_SHARED=ON \
    -DBOX2D_BUILD_STATIC=ON \
    -DBOX2D_BUILD_EXAMPLES=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/Box2D_v${pkgver}/build

  make DESTDIR=${pkgdir} install

  rm -rf "$pkgdir/usr/share" "$pkgdir/usr/include"
  mv "$pkgdir/usr/lib"{,32}
}
