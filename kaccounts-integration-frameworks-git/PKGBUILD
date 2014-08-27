# Maintainer: Antonio Rojas 

pkgname=kaccounts-integration-frameworks-git
pkgver=r634.f385f06
pkgrel=1
pkgdesc='Small system to administer web accounts for the sites and services across the KDE desktop, including: Google, Facebook, Owncloud, IMAP, 
Jabber and others'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/base/kde-accounts/kaccounts-integration'
license=('GPL')
depends=('kcmutils' 'kio' 'signon-qt5' 'libaccounts-qt5' 'kaccounts-providers-frameworks-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=("git://anongit.kde.org/kaccounts-integration.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd kaccounts-integration
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kaccounts-integration \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DQT_PLUGIN_INSTALL_DIR=lib/qt/plugins
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
