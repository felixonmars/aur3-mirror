# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=screenkast
pkgver=0.1.4
pkgrel=2
pkgdesc="Screen-capture program that supports comment boxes and exports to virtually all video formats"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/screenkast/"
license="GPL"
depends=('kdelibs' 'libinstrudeo' 'tightvnc')
makedepends=('ftgl')
source=(http://dl.sourceforge.net/sourceforge/screenkast/${pkgname}-${pkgver}.tar.gz)
md5sums=('da89f003cd35d19f9bd7ea9426ffb6d0')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/

  # Source the KDE and QT profiles
  [ -f /etc/profile.d/kde.sh ] && source /etc/profile.d/kde.sh
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # Fix the Categories and Generic name in menu shortcut
  sed -e '3,4d' -e 's|Video;;|AudioVideo;|' \
      -e 's|Screen capturing and captorials.com client|Screen Capture|' \
      -i ${startdir}/pkg/opt/kde/share/applications/kde/screenkast.desktop
}
