# Maintainer: Carl Mueller  archlinux at carlm e4ward com

pkgname=kdeplasma-applets-netgraph
pkgver=0.4
pkgrel=1
pkgdesc="Kdeplasma plasmoid that displays network usage"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/plasma-netgraph?content=136068"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-netgraph-plasmoid')
replaces=('plasma-netgraph-plasmoid')
source=("http://www.binro.org/plasma-netgraph-$pkgver.tar.bz2")
md5sums=('f61d77ff725ac78a292506cd77ee3daa')

build() {
  mkdir build
  cd build
  cmake ../plasma-netgraph-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}