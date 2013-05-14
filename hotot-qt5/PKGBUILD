# Maintainer: speps <speps at aur dot archlinux dot org>

_uname=lyricat
_commit=e0c78bf
pkgname=hotot-qt5
pkgver=0.9.8.14
pkgrel=1
pkgdesc="A lightweight & open source microblogging software (twitter identi.ca). Qt5 frontend."
arch=('i686' 'x86_64')
url="http://www.hotot.org/"
license=('LGPL3')
depends=('hotot-data' 'qt5-webkit')
makedepends=('cmake' 'intltool' 'python2')
install="$pkgname.install"
source=("https://github.com/$_uname/Hotot/archive/$pkgver.tar.gz")
md5sums=('7437f5132a50f7239e1b4bd09f410a17')

build() {
  cd ${srcdir}/Hotot-*
  [ -d bld ] || mkdir bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DWITH_GTK=OFF \
           -DWITH_GTK2=OFF \
           -DWITH_GTK3=OFF \
           -DWITH_QT=OFF \
           -DWITH_QT5=ON \
           -DWITH_CHROME=OFF \
           -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package() {
  cd ${srcdir}/Hotot-*/bld/qt5
  DESTDIR="$pkgdir/" cmake -P cmake_install.cmake
}

# vim:set ts=2 sw=2 et:
