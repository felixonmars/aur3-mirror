# $Id: PKGBUILD 229849 2015-01-24 10:43:43Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kmix
pkgver=14.12.1
pkgrel=1
pkgdesc="KDE volume control program (KF5 version)"
url='http://kde.org/applications/multimedia/kmix/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdemultimedia')
depends=('kdelibs4support' 'kcmutils' 'libcanberra')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdemultimedia-kmix')
provides=('kdemultimedia-kmix')
optdepends=('libcanberra-pulse: PulseAudio support')
install="${pkgname}.install"
source=("http://download.kde.org/stable/applications/${pkgver}/src/kmix-${pkgver}.tar.xz")
sha1sums=('13774012a4a2ed8fab3cdf4b207de81a448e40d9')

prepare() {
  mkdir build

  cd kmix-${pkgver}
  sed -e 's|CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR}|CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR} ${CMAKE_SOURCE_DIR}/cmake/modules|' -i CMakeLists.txt
}

build() {
  cd build
  cmake ../kmix-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKMIX_KF5_BUILD=ON \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
