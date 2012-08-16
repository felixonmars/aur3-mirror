# Maintainer: t3ddy  <t3ddy1988 "at" gmail {dot} com>

pkgname=kdeplasma-applets-tuxeyes
pkgver=1.0
pkgrel=1
pkgdesc="Wear your desktop with a funny Tux who follows your mouse with his eyes."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Tux+Eyes?content=120161"
license=('GPL')
depends=('kdebase-workspace>=4.2')
makedepends=('gcc' 'cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/120161-Tux_Eyes.tar.gz)
md5sums=('b7ce3be1968e24e4d086e3f07eaa5080')

conflicts=('tuxeyes-plasmoid')
replaces=('tuxeyes-plasmoid')
 
build() {
  cd $srcdir/Tux_Eyes
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. 
  make
  make DESTDIR="$pkgdir/" install
}