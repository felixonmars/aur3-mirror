# $Id$
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=kdeplasma-addons-applets-keren-svn
pkgver=1079983
pkgrel=1
pkgdesc="A plasmoid to take picture from available webcam"
arch=('i686' 'x86_64')
url="http://websvn.kde.org/trunk/playground/base/plasma/applets/keren/"
license=('GPL' 'LGPL')
groups=('kde' 'kdeplasma-addons')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'kdebase-workspace' 'kdegraphics-libs' 'gstreamer0.10-base')
depends=('kdebase-workspace' 'gstreamer0.10-base')
provides=('kdeplasma-addons-applets-keren')
conflicts=('kdeplasma-addons-applets-keren')
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/keren/
_svnmod=keren

source=()
md5sums=()

build() {
  cd $srcdir
      svn co $_svntrunk $_svnmod
       msg "SVN checkout done or server timeout"
       msg "Starting make..."
  mkdir build
  cd build
  cmake ../$_svnmod \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR=$pkgdir install
}
