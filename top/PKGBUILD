# Developer: hugo.pereira@free.fr
# Maintainer: Funkin-Stoopid <>
# Contributor: Funkin-Stoopid <>
pkgname=top
pkgver=2.2.3
_pkgsuffix=0
pkgrel=1
pkgdesc="A windowed version of the console top command for Qt4"
arch=('i686' 'x86_64')
url="http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=Top&full=0"
md5sums=('f24119e900116f3c6b699d6df3c2ecbc')
license=('GPL')
depends=('qt4' 'procps-ng' 'util-linux')
makedepends=('cmake' 'make')
# options=(!makeflags)
source=(http://hugo.pereira.free.fr/software/tgz/Top-$pkgver.tar.gz)
build() {
  cd $srcdir/Top-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
  cd $srcdir/Top-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/Top-$pkgver/Top.png $pkgdir/usr/share/pixmaps/Top.png
  install -Dm644 $srcdir/Top-$pkgver/Top.desktop $pkgdir/usr/share/applications/Top.desktop
  install -Dm755 $srcdir/Top-$pkgver/COPYING $pkgdir/usr/share/doc/Top/COPYING
  install -Dm755 $srcdir/Top-$pkgver/INSTALL $pkgdir/usr/share/doc/Top/INSTALL
}
