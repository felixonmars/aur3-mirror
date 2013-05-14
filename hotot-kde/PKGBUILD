# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=hotot-kde
pkgver=0.9.8.14
pkgrel=1
pkgdesc="A lightweight & open source microblogging software (twitter identi.ca)."
arch=('i686' 'x86_64')
url="http://www.hotot.org/"
license=('LGPL3')
depends=("hotot-data=${pkgver}" 'kdebase-runtime' 'qt4')
makedepends=('cmake' 'intltool')
install="hotot-kde.install"
source=("https://github.com/lyricat/Hotot/archive/$pkgver.tar.gz")
md5sums=('7437f5132a50f7239e1b4bd09f410a17')
options=('strip' 'debug')

build() {
  cd "${srcdir}/Hotot-${pkgver}"
  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_GTK=OFF \
    -DWITH_QT=ON \
    -DWITH_KDE=ON \
    -DWITH_CHROME=OFF \
    -DHOTOT_KDE_BIN_NAME=hotot-kde
  make
  make install DESTDIR="${PWD}/pkg"
}

package() {
  cd "$srcdir/Hotot-${pkgver}/build/pkg"

  install -Dm755 usr/bin/hotot-kde "$pkgdir/usr/bin/hotot-kde"
  install -Dm644 usr/share/applications/hotot-kde.desktop \
    "$pkgdir/usr/share/applications/hotot-kde.desktop"
  cp -a usr/share/apps "$pkgdir/usr/share/"
}
