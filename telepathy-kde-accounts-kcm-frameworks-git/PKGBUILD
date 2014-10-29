# Maintainer: Antonio Rojas 

pkgname=telepathy-kde-accounts-kcm-frameworks-git
pkgver=r970.1bd854d
pkgrel=1
pkgdesc='KCM Module for configuring Telepathy Instant Messaging Accounts'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('kcmutils' 'kio' 'telepathy-qt5')
makedepends=('extra-cmake-modules' 'git')
source=("git://anongit.kde.org/ktp-accounts-kcm.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd ktp-accounts-kcm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-accounts-kcm \
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
