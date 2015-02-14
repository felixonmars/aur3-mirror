# Maintainer: Antonio Rojas
# Contributor: Alexander Mezin <mezin.alexander@gmail.com>

pkgname=kcm-touchpad-git
pkgver=r361.e267c5f
pkgrel=1
pkgdesc='KCM, daemon and applet for touchpad'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/utils/kcm-touchpad'
license=('GPL')
depends=('xcb-util-cursor' 'plasma-framework' 'knotifyconfig' 'kded' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'xorg-server-devel' 'xf86-input-synaptics' 'git')
optdepends=('xf86-input-synaptics: synaptics X driver backend' 'xf86-input-libinput: libinput X driver backend')
conflicts=('kcm-touchpad' 'kcm-touchpad-frameworks')
provides=('kcm-touchpad-frameworks')
source=('git://anongit.kde.org/kcm-touchpad.git')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd kcm-touchpad
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcm-touchpad \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
