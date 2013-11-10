# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: xduugu

pkgname=lib32-qtcurve-utils
pkgver=1.8.17
pkgrel=2
pkgdesc='A configurable set of widget styles for KDE and Gtk. Multilib.'
arch=('x86_64')
url="https://github.com/QtCurve/qtcurve"
license=('GPL')
groups=('qtcurve')
depends=('lib32-libx11')
makedepends=('cmake' 'gcc-multilib')
source=($url/archive/$pkgver.tar.gz
        $pkgname-no-xcb-image.patch)
md5sums=('c4f2e9bc296398b42bfc132b88a3b989'
         '40bd1d75a948d69df8c6d83f7383300d')

prepare() {
  cd qtcurve-$pkgver

  # do not check for qt{4,5} and gtk2 libraries
  sed -i '/^add_sub.*[gq]tk*[2,4,5]/d' CMakeLists.txt

  # do not look for xcb-util-image
  patch -p1 -i ../${source[1]}
}

build() {
  cd qtcurve-$pkgver

  # export multilib parameters
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  [ -d bld ] || mkdir bld && cd bld

  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DLIB_INSTALL_DIR=/usr/lib32 \
           -DQTC_QT4_ENABLE_KDE=false \
           -DENABLE_QT4=false \
           -DENABLE_QT5=false \
           -DENABLE_GTK2=false

  cd qtcurve-utils
  make
}

package() {
  cd qtcurve-$pkgver/bld/qtcurve-utils
  make DESTDIR="$pkgdir" install
}
