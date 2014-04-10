# Maintainer: Spyros Stathopoulos <foucault.online at gmail dot com>
# Contributor: Ulrich Keller <uhkeller at gmail dot com>
# Contributor: James Thomas <dairy_water at yahoo dot co dot uk>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>

_pkgname=cantata
pkgname="${_pkgname}-qt"
pkgver=1.3.4
pkgrel=2
pkgdesc="Qt client for the music player daemon (MPD) (without kdelibs)"
arch=('i686' 'x86_64')
url="https://code.google.com/p/cantata/"
license=('GPL')
depends=('taglib-extras' 'ffmpeg' 'mpg123' 'phonon-qt5' 'libcddb'
'libmusicbrainz5' 'qt5-base' 'qt5-webkit' 'qt5-svg')
optdepends=('libmtp: to support MTP devices'
'oxygen-icons: to fill in otherwise missing icons')
makedepends=('cmake' 'qt5-tools')
provides=('cantata')
conflicts=('cantata')
install=${pkgname}.install
source=("https://drive.google.com/uc?export=download&id=0Bzghs6gQWi60WTYtaXk3c1IzNVU")
md5sums=('5b21329a4b00716f7feb827805f215b5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_KDE=NO \
    -DENABLE_QT5=YES \
    -DCMAKE_PREFIX_PATH=/usr/lib/qt
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make DESTDIR=${pkgdir} install
}

# vim:ts=2:sw=2:et
