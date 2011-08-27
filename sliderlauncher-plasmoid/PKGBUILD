# Maintainer: ShadowKyore <shadowkyogre@gmail.com>

pkgname=sliderlauncher-plasmoid
pkgver=0.1
pkgrel=r16beta
pkgdesc="A compact launcher plasmoid that allows one to store lots of launchers in a small amount of space"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Slidelauncher?content=112619&PHPSESSID=97c3417291e388dc7599c183e80733b0"
depends=('kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
source=(http://slidelauncher.googlecode.com/files/sliderlauncher-$pkgver-$pkgrel.tar.bz2)
license=('GPL')
md5sums=('48141974c50ad061dcb8fc5134ba5ae0')

build() {
  cd $srcdir/sliderlauncher-$pkgver-$pkgrel
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make VERBOSE=1 || return 1
  make DESTDIR=$pkgdir install || return 1
}