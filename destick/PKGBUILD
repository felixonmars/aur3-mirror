# Maintainer: Matej Svejda <mata@aw-modell.com>
pkgname=destick
pkgver=0.3
pkgrel=1
pkgdesc="A desktop metronome"
arch=(i686 x86_64)
url="http://code.google.com/p/destick/"
depends=('kdelibs>=3.5.0' 'sdl_mixer')
conflicts=()
provides=()
makedepends=('cmake>=2.4')
source=(http://destick.googlecode.com/files/destick-0.3.tar.gz)
license=('GPL')

md5sums=('a8b2a2fe8be2373b5a7081fa2709d894')
build() {
  cd ${startdir}/src/destick-${pkgver}
  # If this doesn't work for you try doing export QTDIR=/opt/qt
  cmake . -DCMAKE_INSTALL_PREFIX=/opt/kde -DQT_MOC_EXECUTABLE=/opt/qt/bin/moc
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
