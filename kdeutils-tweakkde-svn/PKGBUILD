# $Id$
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=kdeutils-tweakkde-svn
pkgver=1024825
pkgrel=2
pkgdesc="Utility to configure some of the KDE settings"
arch=('i686' 'x86_64')
url="http://websvn.kde.org/trunk/playground/utils/tweakkde"
license=('GPL' 'LGPL')
groups=('kde' 'kdeutils')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'kdebase-workspace' 'kdegraphics-libs')
depends=('kdebase-runtime' 'kdebase-lib')
provides=('kdeutils-tweakkde' 'tweakkde')
conflicts=('kdeutils-tweakkde' 'tweakkde')
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/utils/tweakkde
_svnmod=tweakkde

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