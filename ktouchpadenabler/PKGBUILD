# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=ktouchpadenabler
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple KDED daemon to enable/disable the touchpad on the press of XF86XK_TouchpadToggle"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/base/ktouchpadenabler'
license=('LGPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/stable/extragear/${pkgname}-${pkgver}.tar.bz2")
md5sums=('6177f16b7395bd1040c6e2c0f2a267ec')

build() {
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
     -DCMAKE_BUILD_TYPE=Release \
     -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
