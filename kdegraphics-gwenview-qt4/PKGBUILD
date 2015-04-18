# Maintainer: Fincer <fincer89 at hotmail dot com>

pkgname=kdegraphics-gwenview-qt4
pkgver=4.14.3
pkgrel=2
pkgdesc="A fast and easy to use image viewer for KDE (QT4 version)"
url="http://kde.org/applications/graphics/gwenview/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdegraphics')
depends=('kdebase-lib' 'kdebase-runtime' 'libkipi' 'baloo' 'libkdcraw')
makedepends=('cmake' 'automoc4' 'mesa')
conflicts=('gwenview')
optdepends=('kipi-plugins: extra plugins to share photos')
install=$pkgname.install
source=("http://download.kde.org/stable/${pkgver}/src/gwenview-${pkgver}.tar.xz")
sha1sums=('dfa98856fbcd7e51050f23716d7f24dab264bf12')

build() {
  mkdir build
  cd build
  cmake ../gwenview-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
