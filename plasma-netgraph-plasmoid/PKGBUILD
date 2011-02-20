# Maintainer: Carl Mueller  archlinux at carlm e4ward com
pkgname=plasma-netgraph-plasmoid
pkgver=0.4
pkgrel=1
pkgdesc="Kdeplasma plasmoid that displays network usage."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/plasma-netgraph?content=136068"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'gcc' 'automoc4')
source=(http://www.binro.org/plasma-netgraph-$pkgver.tar.bz2)
md5sums=('f61d77ff725ac78a292506cd77ee3daa')
build() {
  cd $srcdir/plasma-netgraph-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
