# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=kdeplasma-applets-homerum
_pkgname=homerun
pkgver=0.1.0
pkgrel=1
pkgdesc="An application launcher for KDE Plasma desktop"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/base/homerun"
license=('GPL' 'LGPL' 'BSD')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://download.kde.org/unstable/$_pkgname/src/$_pkgname-$pkgver.tar.bz2")
install=$_pkgname.install
md5sums=('7e4b9a6d1ae6fafe7df1c066d50dc6f2')

build() {
  cd "$srcdir"
  mkdir build
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE.BSD" "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
}
