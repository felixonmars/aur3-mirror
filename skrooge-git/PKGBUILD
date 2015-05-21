# Creator: Rick W. Chen <stuffcorpse@archlinux.us>
# Maintainer: André Vitor de Lima Matos <andre.vmatos@gmail.com>

pkgname=skrooge-git
pkgver=r3849.f4a3fdb
pkgrel=1
pkgdesc="A personal finances manager based on KF5"
arch=('i686' 'x86_64')
url="https://skrooge.org/"
license=('GPL')
depends=('grantlee-qt5' 'karchive' 'kconfig' 'kcoreaddons' 'ki18n' 'kitemviews'
  'kwidgetsaddons' 'kwindowsystem' 'kcompletion' 'kdoctools' 'kjobwidgets'
  'kconfigwidgets' 'kdesignerplugin' 'kiconthemes' 'kio' 'knewstuff' 'kparts'
  'kwallet' 'kxmlgui' 'libofx')
makedepends=('git' 'gcc' 'cmake' 'xdg-utils' 'extra-cmake-modules')
provides=('skrooge=1.12.0')
conflicts=('skrooge')
source=("git://anongit.kde.org/skrooge.git#branch=kf5")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd skrooge
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../skrooge \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
