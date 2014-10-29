# Maintainer: Antonio Rojas 

pkgname=telepathy-kde-desktop-applets-frameworks-git
pkgver=r813.6123853
pkgrel=1
pkgdesc='The KDE-Telepathy Plasma desktop applets'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals-frameworks-git' 'telepathy-kde-accounts-kcm-frameworks-git' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'git')
source=("git://anongit.kde.org/ktp-desktop-applets.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd ktp-desktop-applets
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-desktop-applets \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
