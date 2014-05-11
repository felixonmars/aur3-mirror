# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=khtml
pkgver=4.99.0
pkgrel=1
pkgdesc='KHtml'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/khtml'
license=('LGPL')
depends=('phonon-qt5' 'giflib' 'qt5-x11extras' 'karchive' 'kcodecs' 'kglobalaccel' 'ki18n' 'kiconthemes' 'kio'
'kparts' 'kwallet')
makedepends=('extra-cmake-modules')
groups=('kf5-aids')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/portingAids/${pkgname}-${pkgver}.tar.xz")
md5sums=('8ab2e9a686e43c4169e9835ca3e4c7df')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
