# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: xduugu

pkgname=lib32-qtcurve-qt4
pkgver=1.8.17
pkgrel=1
pkgdesc='A configurable set of widget styles for KDE and Gtk. Multilib.'
arch=('x86_64')
url="https://github.com/QtCurve/qtcurve"
license=('GPL')
groups=('qtcurve')
depends=('lib32-qt4' 'lib32-qtcurve-utils')
makedepends=('cmake' 'gcc-multilib')
source=($url/archive/$pkgver.tar.gz qconfig.h)
md5sums=('c4f2e9bc296398b42bfc132b88a3b989'
         '6b89fb32651dd73d1c02185d23b86186')

build() {
  cd qtcurve-$pkgver

  # export multilib parameters
  # and QT_BUILD_KEY workaround
  export CC="gcc -m32 -I$srcdir"
  export CXX="g++ -m32 -I$srcdir"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  [ -d bld ] || mkdir bld && cd  bld

  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DQT_PLUGINS_DIR=/usr/lib32/qt/plugins \
           -DQTC_QT4_ENABLE_KDE=false \
           -DENABLE_GTK2=false \
           -DENABLE_QT5=false

  cd qt4
  make
}

package() {
  cd qtcurve-$pkgver/bld/qt4
  make DESTDIR="$pkgdir" install
}
