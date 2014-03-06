# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=phonon-gstreamer-qt5
pkgver=4.7.1
pkgrel=1
arch=('i686' 'x86_64')
url='http://phonon.kde.org/'
pkgdesc="Phonon GStreamer backend (Qt5 version)"
license=('LGPL')
depends=('gstreamer0.10-base-plugins' 'phonon-qt5')
makedepends=('cmake' 'automoc4')
provides=('phonon-qt5-backend')
install="${pkgname}.install"
source=("http://download.kde.org/stable/phonon/phonon-backend-gstreamer/${pkgver}/phonon-backend-gstreamer-${pkgver}.tar.xz")
md5sums=('7c0cfab4ec0bbe1f201503e6ccc7290a')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../phonon-backend-gstreamer-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DPHONON_BUILD_PHONON4QT5=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  # conflict with phonon-gstreamer
  rm -fr ${pkgdir}/usr/share
}
