# Maintainer: Oliver Friedrich

pkgname=kdeplasma-applets-datetimegroup
pkgver=0
pkgrel=1
pkgdesc="A plasmoid for those who are using NATO (or armed forces) date time groups"
arch=('any')
url="http://kde-look.org/content/show.php?content=145636"
license=('GPL')
depends=('kdebase-workspace')
conflicts=('datetimegroup-plasmoid')
replaces=('datetimegroup-plasmoid')
makedepends=('cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/145636-kdeplasma-applets-datetimegroup-0.tar.gz)
md5sums=('e623f83fdb994cc37aff318d4f881dbd')
build() {
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release ../${pkgname}-${pkgver}
  make
  make DESTDIR=$pkgdir install
}
