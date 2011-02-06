# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=qframecatcher
pkgver=0.4.1
pkgrel=3
pkgdesc="An application that captures frames from a video file and saves these frames as thumbnails"
arch=(i686 x86_64)
url="http://www.kde-apps.org/content/show.php?content=37163"
license="GPL"
depends=('qt4' 'xine-lib')
source=(http://download.berlios.de/qframecatcher/${pkgname}-${pkgver}.tar.gz \
        qframecatcher.desktop)
md5sums=('8961f41fa3828ed86368ab4f3a46a020' '380dc2eae034d017f437b14b06a1ef61')

build() {
  cd ${startdir}/src/${pkgname}/src/

  # Source the QT4 profile
  [ -f /etc/profile.d/qt4.sh ] && source /etc/profile.d/qt4.sh

  ${QTDIR}/bin/qmake
  make || return 1

  # Install binary
  install -D -m755 qframecatcher ${startdir}/pkg/usr/bin/qframecatcher

  # Install shortcut and icon
  install -D -m644 ${startdir}/src/qframecatcher.desktop ${startdir}/pkg/usr/share/applications/qframecatcher.desktop
  install -D -m644 icons/logo.xpm ${startdir}/pkg/usr/share/pixmaps/qframecatcher.xpm
}
