# Contributor:

pkgname=kf5umbrella-git
pkgver=r25.fdf3d34
pkgrel=1
pkgdesc="KF5 Umbrella"
arch=('any')
url='https://projects.kde.org/projects/frameworks/kf5umbrella'
license=('LGPL')
depends=('')
makedepends=('extra-cmake-modules' 'git')
provides=('kf5umbrela')
conflicts=('kf5umbrella')
source=('git://anongit.kde.org/kf5umbrella.git')
md5sums=('SKIP')

pkgver() {
  cd kf5umbrella
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kf5umbrella \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DQT_PLUGIN_INSTALL_DIR=lib/qt/plugins
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}