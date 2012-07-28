# Maintainer: Carl Mueller arch at carlm e4ward com

pkgname=kdeplasma-applets-mountoid
pkgver=0.41
pkgrel=1
pkgdesc="Plasmoid to show and control mount points"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Mountoid?content=115943"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('kdeplasma-mountoid-plasmoid')
replaces=('kdeplasma-mountoid-plasmoid')
source=("http://kde-look.org/CONTENT/content-files/115943-mountoid-${pkgver}.tar.gz")
md5sums=('17422a08bcbe8f43a15d909f895bfe0c')

build() {
  mkdir build
  cd build
  cmake ../mountoid \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}