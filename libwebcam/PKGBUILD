pkgname=libwebcam
pkgver=0.2.5
pkgrel=1
pkgdesc="Webcam Library"
arch=('i686' 'x86_64' 'armv6l')
url="http://sourceforge.net/projects/libwebcam/"
license=('GPL3')
depends=('libxml2')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/${pkgname}/source/${pkgname}-src-${pkgver}.tar.gz")
sha256sums=('3ca5199c7b8398b655a7c38e3ad4191bb053b1486503287f20d30d141bda9d41')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|DESTINATION[ \t][ \t]*/lib|DESTINATION lib|g' uvcdynctrl/CMakeLists.txt
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_SKIP_RPATH=ON \
           -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR=$pkgdir install
  install -Dm644 ../common/include/* "$pkgdir"/usr/include/
}