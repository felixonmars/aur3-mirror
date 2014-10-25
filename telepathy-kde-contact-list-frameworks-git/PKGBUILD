# Maintainer: Antonio Rojas 

pkgname=telepathy-kde-contact-list-frameworks-git
pkgver=r973.dd7ad05
pkgrel=1
pkgdesc='KDE Telepathy contact list application'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals-frameworks-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python')
conflicts=('telepathy-kde-contact-list-frameworks' 'telepathy-kde-contact-list')
provides=('telepathy-kde-contact-list-frameworks')
source=("git://anongit.kde.org/ktp-contact-list.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd ktp-contact-list
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-contact-list \
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
