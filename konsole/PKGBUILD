# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=konsole
pkgver=v4.11.0.r106.g474c893
pkgrel=1
pkgdesc="KDE's terminal emulator"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/konsole'
license=('LGPL')
depends=('kio' 'kde4support' 'knotifyconfig' 'kparts' 'kpty')
makedepends=('extra-cmake-modules' 'git')
provides=('konsole')
conflicts=('konsole')
source=('git://anongit.kde.org/konsole.git#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd konsole
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../konsole \
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
