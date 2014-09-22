pkgname=box2d-pc
pkgver=2.3.1
pkgrel=1
pkgdesc="2D rigid body simulation library for games, with pkg-config file"
url="http://www.box2d.org/"
license=('zlib')
provides=('box2d')
conflicts=('box2d')
replaces=('box2d')
arch=('i686' 'x86_64')
makedepends=('cmake' 'doxygen' 'svn')
optdepends=()
source=("${pkgname}-${pkgver}::svn+http://box2d.googlecode.com/svn/tags/v${pkgver}"
'pkgconfig.patch'
'box2d.pc.in'
'ConfigureBuild.cmake'
)
md5sums=('SKIP' '240658f3bbb4641b910a71162094f184' '6e2ef3c43766dce55f381faace450006' '169594f704269ab27c56718481882aa8')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/Box2D
  patch -i ../../pkgconfig.patch 
  mkdir -p CMake
  cp ../../box2d.pc.in CMake
  cp ../../ConfigureBuild.cmake CMake
  [[ -d build ]] && rm -r build
  mkdir build && cd build 
	cmake .. \
    -DBOX2D_INSTALL=ON \
    -DBOX2D_INSTALL_DOC=ON \
    -DBOX2D_BUILD_SHARED=ON \
    -DBOX2D_BUILD_STATIC=OFF \
    -DBOX2D_BUILD_EXAMPLES=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/Box2D

  cd Documentation
  doxygen

  cd ../build

  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/Box2D/License.txt ${pkgdir}/usr/share/licenses/box2d/LICENSE
}
# vim: sw=2 ts=2 et:
