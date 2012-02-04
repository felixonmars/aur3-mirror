# $Id$
# Maintainer: David C. Rankin <drankinatty@gmail.com>
#
# All modifications and uses of this file are licensed under
# the software for which this file was made for, should the software
# be under an Open Source License, at least version 1.9, defined
# by the Open Source Initiative. In other cases, this file is automatically
# released to the Public Domain.
#

pkgname=trinity-kdegraphics
pkgver=3513
pkgrel=1.0
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL')
groups=('trinity-extras')
pkgdesc="Trinity - kdegraphics"
depends=('trinity-kdebase' 'libart-lgpl' 'libgphoto2' 'libtiff' 'openexr' 't1lib')
makedepends=('pkgconfig' 'cmake' 'imake' 'fribidi')
# 'poppler-qt'
optdepends=('xscreensaver: Screen saver and locker for the X Window System')
provides=('trinity-kdegraphics')
conflicts=('trinity-kdegraphics')
replaces=('trinity-kdegraphics')
options=('libtool' '!strip')
source=('GSmartPointer.h.patch' 'http://mirror.its.uidaho.edu/pub/trinity/releases/3.5.13/kdegraphics-3.5.13.tar.gz')
md5sums=('7b93c9bdf1208df453c9838519fab109' 'a75c254cd1060343cd04c6744bce6798')

_svnmod=kdegraphics
trinity_prefix="/opt/trinity"

build() {

  # patch for gcc-4.6
  if grep -q cstddef  ${srcdir}/kdegraphics/kviewshell/plugins/djvu/libdjvu/GSmartPointer.h; then
    msg "Patch for GCC 4.6 - Previously Applied"
  else
    msg "Applying Patch for GCC 4.6"
    patch -p0 -i ${srcdir}/GSmartPointer.h.patch || return 1
  fi

  msg "Setting PATH, CMAKE and Trinity Environment variables"
  export CMAKE_PREFIX_PATH=/opt/qt:/opt/trinity
  if [[ -r /etc/profile.d/qt3.sh ]]; then
    . /etc/profile.d/qt3.sh
    [[ -n $QTDIR ]] && _qtdir=$QTDIR
  else
    [[ ${PATH%%:*} =~ ${_qtdir}/bin ]] || export PATH=${_qtdir}/bin:$PATH
  fi

   export CMAKE_INCLUDE_PATH=/opt/qt/include:/opt/qt/include/tqt:/usr/include/dbus-1.0:/opt/trinity/include:/opt/trinity/include/libkrandr:/usr/include
   export LD_LIBRARY_PATH=/opt/trinity/lib:/opt/trinity/lib/kde3:$LD_LIBRARY_PATH
   export PKG_CONFIG_PATH=:/opt/trinity/lib/pkgconfig:/opt/qt/lib/pkgconfig

  cd $srcdir
  msg "Creating out-of-source build directory: ${srcdir}/build"
  mkdir -p build
  cd build

  msg "Starting cmake..."
  cmake ${srcdir}/${_svnmod} \
    -DCMAKE_INSTALL_PREFIX=${trinity_prefix} \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DQT_VERSION=3 \
    -DCMAKE_CXX_FLAGS="-fpermissive" \
    -DWITH_T1LIB=ON \
    -DWITH_LIBPAPER=ON \
    -DWITH_TIFF=ON \
    -DWITH_OPENEXR=ON \
    -DWITH_PAM=ON \
    -DBUILD_ALL=ON
  make

#     -DWITH_PDF=ON \ (waiting on poppler-qt3)

#     -DWITH_QT3=ON \
#     -DQTDIR=/opt/qt \
#     -DQT_LIBRARY_DIRS=/opt/qt/lib \
}

package() {
  msg "Packaging - $pkgname-$pkgver"
  cd ${srcdir}/build

  make DESTDIR="$pkgdir/" install

  cd ${startdir}
}
