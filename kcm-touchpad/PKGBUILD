# Maintainer: A Rojas < nqn1976 @ gmail.com >
# Contributor: Alexander Mezin <mezin.alexander@gmail.com>

pkgname=kcm-touchpad
pkgver=0.9
pkgrel=1
pkgdesc="A KCModule for configuring the touchpad."
arch=('i686' 'x86_64')
url="https://github.com/sanya-m/kde-touchpad-config"
license=('GPL')
depends=('kdebase-workspace' 'xf86-input-synaptics')
makedepends=('cmake' 'automoc4' 'xorg-server-devel')
source=("https://github.com/sanya-m/kde-touchpad-config/archive/v${pkgver}.tar.gz")
md5sums=('2d60b154b60a745a931ded129a6297d6')

prepare() {
  cd kde-touchpad-config-${pkgver}
  mkdir build
}

build() {
  cd kde-touchpad-config-${pkgver}/build
  cmake .. -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)"
  make
}

package() {
  cd kde-touchpad-config-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
