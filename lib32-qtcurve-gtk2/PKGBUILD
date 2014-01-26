# Maintainer: Yichao Yu <yyc1992@gmail.com>
# Contributor: Archan Paul <arp at archan dot org>
# Contributor: Clement Siuchung Cheung <clement.cheung@umich.edu>
# Contributor : mightyjaym <jmambrosino@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
# Contributor: Harvey <harv@gmx.de>
# Contributor: <Tilo Brueckner>  blueperil@gmx.de
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: xduugu

pkgname=lib32-qtcurve-gtk2
pkgver=1.8.18
pkgrel=1
pkgdesc='A configurable set of widget styles for KDE and Gtk. Multilib.'
arch=('x86_64')
url="https://github.com/QtCurve/qtcurve"
license=('LGPL')
groups=('qtcurve')
makedepends=('cmake' 'gcc-multilib' 'lib32-gtk2' 'lib32-libxcb')
source=($url/archive/$pkgver.tar.gz)
md5sums=('422d1876d944bb278855f320eda19368')
options=('strip' 'debug')

build() {
  cd qtcurve-$pkgver

  # export multilib parameters
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  [ -d bld ] || mkdir bld && cd  bld

  cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib32 \
    -DQTC_KDE4_PREFIX=/usr/ \
    -DENABLE_GTK2=true \
    -DENABLE_QT5=false \
    -DENABLE_QT4=false

  make
}

package() {
  depends=(lib32-libxcb lib32-qtcurve-utils=${pkgver} lib32-pango lib32-cairo
    lib32-gtk2 qtcurve-gtk2)
  make -C qtcurve-$pkgver/bld/gtk2/style DESTDIR="$pkgdir" install
  make -C qtcurve-$pkgver/bld/lib/cairo DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/usr/share"
}
