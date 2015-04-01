pkgname=telepathy-kde-desktop-applets-legacy
pkgver="1.0"
pkgrel=3
pkgdesc='The KDE-Telepathy Plasma desktop applets (legacy version for Telepathy 0.9)'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals>=0.9.0' 'telepathy-kde-common-internals<1.0.0' 'plasma-workspace' 'telepathy-qt5')
makedepends=('extra-cmake-modules') 
replaces=('telepathy-kde-desktop-applets')
source=("http://download.kde.org/stable/kde-telepathy/legacy/src/ktp-legacy-presence-applet-${pkgver}.tar.xz")
sha256sums=('2a10a84b04da6801cd8843bc6498b5d5b0fd7acff561ab81366d673f5032207f')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake $srcdir/ktp-legacy-presence-applet-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib/qt
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
