# Maintainer: equeim <equeim@gmail.com>

pkgname=xfce4-snw-plugin
pkgver=0.5.1
pkgrel=1
pkgdesc="Plugin for xfce4-panel to show StatusNotifierItems (also known as AppIndicators)"
url="https://github.com/equeim/xfce4-snw-plugin"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libdbusmenu-gtk2' 'xfce4-panel')
makedepends=('cmake' 'vala')
source=("https://github.com/equeim/xfce4-snw-plugin/archive/${pkgver}.tar.gz")
sha256sums=('7305e00abc2ca3073b5712a57163b545a3393af3ef933db0588629c55ab78780')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=Debug
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


