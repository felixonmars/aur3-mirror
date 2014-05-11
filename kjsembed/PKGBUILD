# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kjsembed
pkgver=4.99.0
pkgrel=1
pkgdesc='KJSEmbed'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kjsembed'
license=('LGPL')
depends=('ki18n' 'qt5-svg')
makedepends=('extra-cmake-modules' 'qt5-tools' 'kdoctools')
groups=('kf5-aids')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/portingAids/${pkgname}-${pkgver}.tar.xz")
md5sums=('95088bb1d9d8958a24e4783d131ebd6e')

prepare() {
  mkdir -p build
}

build() {
  export XDG_DATA_DIRS="/opt/kf5/share:$XDG_DATA_DIRS"

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
