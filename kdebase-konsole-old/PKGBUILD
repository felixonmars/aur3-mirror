# $Id$
# Maintainer: Mladen Pejaković <pejakm at autistici.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdebase-konsole-old
pkgver=4.14.3
pkgrel=5
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/konsole/'
pkgdesc="KDE 4 Terminal emulator"
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdebase')
depends=('konsolepart4')
makedepends=('cmake' 'automoc4')
provides=('konsole')
conflicts=('konsole')
source=("http://ftp5.gwdg.de/pub/linux/kde/stable/${pkgver}/src/konsole-${pkgver}.tar.xz")
sha1sums=('5ae78061f38f06f80ee10f4475ff33d1c0843b4d')

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../konsole-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"
  install -Dm755 build/src/konsole "${pkgdir}"/usr/bin/konsole
  install -Dm755 konsole-"${pkgver}"/src/konsoleprofile "${pkgdir}"/usr/bin/konsoleprofile
  install -Dm644 konsole-"${pkgver}"/desktop/konsole.desktop "${pkgdir}"/usr/share/applications/kde4/konsole.desktop
  install -Dm644 build/lib/libkdeinit4_konsole.so "${pkgdir}"/usr/lib/libkdeinit4_konsole.so
}
