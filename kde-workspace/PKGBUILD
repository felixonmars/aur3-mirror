# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kde-workspace
pkgver=4.95.0
pkgrel=3
pkgdesc='Provides the interface and basic tools for the KDE workspace'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('frameworkintegration' 'kcmutils' 'knotifyconfig' 'krunner'
         'kdesu' 'knewstuff' 'khtml' 'libdbusmenu-qt5' 'glu' 'kjsembed'
         'libxkbfile' 'libxcursor' 'lm_sensors' 'libraw1394' 'libusb-compat'
         'pciutils' 'libbsd' 'kf5-akonadi' 'qt5-webkit' 'attica-qt5'
         'kdoctools' 'kemoticons' 'libxrandr')
makedepends=('extra-cmake-modules' 'qt5-tools' 'kf5umbrella')
groups=('plasma-next')
source=("http://download.kde.org/unstable/plasma/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('d5b05a470e1ba9ce8a7c3412a59d1a1f')

prepare() {
  mkdir -p build
}

build() {
  export XDG_DATA_DIRS="/opt/kf5/share:$XDG_DATA_DIRS"
  export CMAKE_PREFIX_PATH="/opt/kf5"

  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DWITH_libgps=OFF
#    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
