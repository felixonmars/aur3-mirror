pkgname=liquid-fun
pkgver=v1.1.0.r4.g4c49f1b
pkgrel=1
pkgdesc="Liquid Fun Box2d Extension"
arch=('i686' 'x86_64')
url="https://google.github.io/liquidfun/"
license=('box2d')
makedepends=('cmake')
provides=('box2d')
conflicts=('box2d')
replaces=('box2d')
provides=('liquidfun')
source=("git+https://github.com/google/liquidfun.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/liquidfun"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/liquidfun/liquidfun/Box2D"

  mkdir build && cd build
        cmake .. \
    -DBOX2D_INSTALL=ON \
    -DBOX2D_INSTALL_DOC=ON \
    -DBOX2D_BUILD_SHARED=ON \
    -DBOX2D_BUILD_STATIC=OFF \
    -DBOX2D_BUILD_EXAMPLES=OFF \
    -DBOX2D_BUILD_UNITTESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make


}

package() {
  cd "$srcdir/liquidfun/liquidfun/Box2D"
 
  cd Documentation
  doxygen

  cd ../build

  make DESTDIR=${pkgdir} install

  install -Dm644 "$srcdir/liquidfun/liquidfun/Box2D/Box2D/Common/b2GrowableBuffer.h" "$pkgdir/usr/include/Box2D/Common/"


}

# vim:set ts=2 sw=2 et: 
