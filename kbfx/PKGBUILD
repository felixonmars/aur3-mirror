# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=kbfx
pkgver=0.4.9.3.1
pkgrel=2
pkgdesc="An alternative to the classical K Menu button and menu"
arch=('i686' 'x86_64')
url="http://www.kbfx.net/staticpages/index.php?page=20060224122953187"
license=('GPL')
depends=('kdelibs>=3.5.7' 'strigi=0.3.11')
makedepends=('cmake')
conflicts=('kbfx-devel' 'kbfx-cvs')
options=(libtool)
install=kbfx.install
source=(http://downloads.sourceforge.net/sourceforge/kbfx/kbfx-${pkgver}.tar.bz2)
md5sums=('47bb5328a3f6dd2cc3f21279b9d0435c')

build() {
  cd ${startdir}/src/kbfx-${pkgver}/

  # Source the KDE and QT profiles
  [ -f /etc/profile.d/kde.sh ] && source /etc/profile.d/kde.sh
  [ -f /etc/profile.d/qt.sh ] && source /etc/profile.d/qt.sh

  cmake -DCMAKE_INSTALL_PREFIX=/opt/kde -DLIB_INSTALL_DIR=/opt/kde/lib \
    -DCMAKE_BUILD_TYPE=Release -DUSE_STRIGI=ON -DUSE_MENUDRAKE=OFF -DUSE_KDE4=OFF

  make || return 1
  make DESTDIR=${startdir}/pkg install
}
