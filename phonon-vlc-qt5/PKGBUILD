# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-vlc-qt5
pkgver=0.7.1
pkgrel=2
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
pkgdesc="Phonon VLC backend (Qt5 version)"
license=('LGPL')
depends=('vlc' 'phonon-qt5')
makedepends=('cmake' 'automoc4')
provides=('phonon-qt5-backend')
source=("http://download.kde.org/stable/phonon/phonon-backend-vlc/${pkgver}/phonon-backend-vlc-${pkgver}.tar.xz")
md5sums=('3c41a3d141d40cedd2819676cdca5ea4')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../phonon-backend-vlc-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DPLUGIN_INSTALL_DIR=/usr/lib/kde4 \
    -DPHONON_BUILD_PHONON4QT5=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
