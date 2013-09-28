# $Id$
# Contributor: Rex Dieter <rdieter@fedoraproject.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Neophytos Kolokotronis <tetris4@gmail.com>
# Maintainer: Antonis G. <capoiosct@gmail.org>

pkgname=compat-telepathy-kde-call-ui
_pkgname=ktp-call-ui
pkgver=0.6.3
pkgrel=3
pkgdesc="Voice/Video Call UI for Telepathy"
arch=('i686' 'x86_64')
url="http://community.kde.org/Real-Time_Communication_and_Collaboration"
license=('GPL')
depends=('telepathy-kde-common-internals' 'kdebase-runtime' 'compat-telepathy-farstream'
         'telepathy-mission-control' 'telepathy-gabble' 'gstreamer0.10-base-plugins'
         'gstreamer0.10-good-plugins' 'qt-gstreamer'  'gstreamer0.10-ugly-plugins'
         'gstreamer0.10-bad-plugins' 'gstreamer0.10-ffmpeg' 'farstream-0.1' )
makedepends=('cmake' 'automoc4' 'boost')
conflicts=('telepathy-kde-call-ui')
replaces=()
provides=('telepathy-kde-call-ui')
groups=('kde-telepathy')
source=("http://download.kde.org/stable/kde-telepathy/${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2"
        'ktp-call-ui-0.5.2-farstream_compat.patch')
sha1sums=('45c8fbd22360bd2625b4e189e752a3f9809130db'
          '693c62654d4ec4fd089b0e14b230876cbf1c0970')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}"/ktp-call-ui-0.5.2-farstream_compat.patch
  cd ../

  mkdir build
}

build() {
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
