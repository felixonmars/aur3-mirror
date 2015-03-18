# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qomp
pkgver=0.8
pkgrel=1
pkgdesc="Quick(Qt) Online Music Player for different online music hostings."
arch=('i686' 'x86_64')
url="http://qomp.sourceforge.net"
license=('GPL2')
depends=('hicolor-icon-theme' 'taglib' 'qt5-multimedia')
makedepends=('cmake' 'qt5-tools')
conflicts=('qomp-git' 'qomp-qt5-git')
source=(http://sourceforge.net/projects/qomp/files/$pkgver/qomp-$pkgver-beta.tar.gz)
md5sums=('990cbdcb252b7c5aba071b8ca166a920')

# All available plugins. Delete plugins you don't want!
_plugins="notificationsplugin;filesystemplugin;urlplugin;prostopleerplugin;myzukaruplugin;yandexmusicplugin;lastfmplugin;tunetofileplugin;mprisplugin"

prepare() {
  cd $srcdir
  # Extract tar.gz
  tar -xf qomp-${pkgver}-beta.tar.gz

  # Set library path to /usr/lib instead of /usr/lib64
  sed -i 's|${LIB_SUFFIX}||' CMakeLists.txt

  # Fix typo
  sed -i 's|updates found|update found|' src/updateschecker.cpp

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT5=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_PLUGINS=${_plugins}
}

build() {
  cd $srcdir
  make
}

package() {
  cd $srcdir
  make DESTDIR=$pkgdir install
}