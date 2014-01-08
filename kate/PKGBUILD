# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kate
pkgver=v4.10.90.r1113.gebb33cd
pkgrel=1
pkgdesc='An advanced editor component which is used in numerous KDE applications requiring a text editing component'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/kate'
license=('LGPL')
depends=('kio' 'kcmutils' 'kitemmodels' 'knewstuff' 'kparts'
         'kprintutils')
makedepends=('extra-cmake-modules' 'git')
provides=('kate')
conflicts=('kate')
source=('git://anongit.kde.org/kate.git#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd kate
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  export XDG_DATA_DIRS="/opt/kf5/share:$XDG_DATA_DIRS"

  cd build
  cmake ../kate \
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
