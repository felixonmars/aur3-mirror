# Maintainer: Alexey D. <lq07829icatm at rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=konsole-git
pkgver=r5563.c15a9a9
pkgrel=1
pkgdesc="KDE's terminal emulator"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/konsole'
license=('LGPL')
depends=('knotifyconfig' 'kpty' 'libkonq-frameworks-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
provides=('konsole')
conflicts=('konsole' 'kdebase-konsole')
source=('git://anongit.kde.org/konsole.git')
md5sums=('SKIP')

pkgver() {
  cd konsole
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../konsole \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
