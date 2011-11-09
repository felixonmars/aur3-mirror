# $Id$
# Maintainer: David C. Rankin <drankinatty@gmail.com>
#
# All modifications and uses of this file are licensed under
# the software for which this file was made for, should the software
# be under an Open Source License, at least version 1.9, defined
# by the Open Source Initiative. In other cases, this file is automatically
# released to the Public Domain.
#

pkgname=trinity-gtk-qt-engine
pkgver=3513
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL')
groups=('trinity-extras')
pkgdesc="Trinity - Qt wrapper for GTK, makes gtk2 apps look pretty under TDE"
depends=('trinity-kdebase')
makedepends=('pkgconfig' 'cmake' 'imake')
options=('libtool' '!strip')
source=(http://mirror.its.uidaho.edu/pub/trinity/releases/3.5.13/applications/gtk-qt-engine-3.5.13.tar.gz)
md5sums=('96da675949ef8743d4fe91531f734030')

_svnmod=applications/gtk-qt-engine

build() {

  msg "Setting PATH, CMAKE and Trinity Environment variables"
  export CMAKE_PREFIX_PATH=/opt/qt:/opt/trinity
  export CMAKE_INCLUDE_PATH=/opt/qt/include:/opt/qt/include/tqt:/usr/include/dbus-1.0:/opt/trinity/include:/opt/trinity/include/libkrandr
  export LD_LIBRARY_PATH=/opt/trinity/lib:/opt/trinity/lib/kde3:$LD_LIBRARY_PATH
  export PKG_CONFIG_PATH=:/opt/trinity/lib/pkgconfig:/opt/qt/lib/pkgconfig

  trinity_prefix="/opt/trinity"

  cd $srcdir
  msg "Creating out-of-source build directory: ${srcdir}/build"
  mkdir -p build
  cd build

  msg "Starting cmake..."
  cmake ${srcdir}/${_svnmod} \
    -DCMAKE_INSTALL_PREFIX=${trinity_prefix} \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DQT_VERSION=3 \
    -DWITH_QT3=ON \
    -DQTDIR=/opt/qt \
    -DQT_DOCDIR=/opt/qt/man \
    -DQT_LIBRARY_DIRS=/opt/qt/lib \
    -DBUILD_ALL=ON
  make
}

package() {
  msg "Packaging - $pkgname-$pkgver"
#   cd ${srcdir}/${_svnmod}
  cd ${srcdir}/build

  make DESTDIR="$pkgdir/" install

#   rm -r ${srcdir}/${_svnmod}
}
