# $Id$
# Maintainer: Laszlo Papp <lpapp@kde.org>

pkgname=cutepaste
pkgver=0.1.0
pkgrel=1
pkgdesc="Paste application for KDE"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/network/cutepaste"
license=('GPLv2')
depends=('qt5-base')
makedepends=('cmake')
#install=cutepaste.install
source=(http://download.kde.org/unstable/cutepaste/${pkgver}/src/${pkgname}-${pkgver}.tar.xz)
sha1sums=('6503497b310dec84ba1dae182f68e8b80137ad59')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
