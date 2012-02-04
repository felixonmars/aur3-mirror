# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=mingw32-box2d
pkgver=2.2.1
pkgrel=1
pkgdesc="2D rigid body simulation library for games (mingw32)"
url="http://www.box2d.org/"
license=('zlib')
arch=('any')
depends=('mingw32-gcc')
makedepends=('cmake')
options=(!strip !buildflags)
source=(http://box2d.googlecode.com/files/Box2D_v${pkgver}.zip
        cmake-toolchain.cmake)
md5sums=('9e9d32a34fb5554c47f0f9cade0fa611'
         'dd2b2db48187dff84050fe191d309d81')

build() {
  cd ${srcdir}/Box2D_v${pkgver}

  sed -i s/Windows\.h/windows.h/g Box2D/Common/b2Timer.cpp
 
  msg "Starting build"
  [[ -d build ]] && rm -r build
  mkdir build && cd build 

  unset LDFLAGS CFLAGS CXXFLAGS
	cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr/i486-mingw32 \
    -DCMAKE_TOOLCHAIN_FILE=${srcdir}/cmake-toolchain.cmake \
    -DBOX2D_INSTALL=ON \
    -DBOX2D_BUILD_EXAMPLES=OFF \
    -DBOX2D_BUILD_SHARED=OFF
  make
	make DESTDIR=${pkgdir} install
}
# vim: sw=2 ts=2 et:
