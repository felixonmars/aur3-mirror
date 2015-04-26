# $Id$
# Maintainer:  Fabien Wang <fabienwang@eliteheberg.fr>

pkgname=kadu-aur
pkgver=2.1
pkgrel=1
pkgdesc='Qt-based Jabber/XMPP and Gadu-Gadu client'
arch=('i686' 'x86_64')
url='http://www.kadu.net/'
license=('GPL')
depends=('libgadu' 'libxss' 'enchant' 'phonon-qt5' 'qca-ossl' 'qca-qt5' 'libidn'
         'libmpdclient' 'libotr' 'libarchive' 'injeqt' 'xdg-utils' 'qt5-multimedia'
         'qt5-quick1' 'qt5-declarative' 'qt5-webkit' 'qt5-x11extras')
makedepends=('cmake' 'libao' 'libsndfile' 'libxtst' 'curl' 'chrpath' 'ninja'
             'qt5-tools')
install=kadu.install
conflicts=('kadu')
source=(http://download.kadu.im/stable/kadu-$pkgver.tar.bz2)
md5sums=('b40f95123b1167c51c26bee8d56577d2')

prepare() {
  sed -i 's/unity_integration//g' kadu-$pkgver/Plugins.cmake
  sed -i 's/indicator_docking//g' kadu-$pkgver/Plugins.cmake
}

build() {
  mkdir build
  cd build

  cmake ../kadu-$pkgver \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4
  ninja
}

package() {
  DESTDIR="$pkgdir" LIBDIR=/usr/lib ninja -C build install
  chrpath -d "$pkgdir"/usr/lib/kadu/plugins/*.so
}

