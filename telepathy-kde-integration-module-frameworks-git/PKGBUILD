# Maintainer: Antonio Rojas 

pkgname=telepathy-kde-integration-module-frameworks-git
pkgver=r310.4439bd4
pkgrel=1
pkgdesc='Sits in KDED and takes care of various bits of system integration like setting user to auto-away or handling connection errors'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals-frameworks-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('telepathy-kde-integration-module-frameworks')
provides=('telepathy-kde-integration-module-frameworks')
source=("git://anongit.kde.org/ktp-kded-module.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd ktp-kded-module
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-kded-module \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
