# Maintainer: Carl Mueller arch at carlm e4ward com

pkgname=kdeplasma-mountoid-plasmoid
pkgver=0.41
pkgrel=1
pkgdesc="Plasmoid to show and control mount points"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Mountoid?content=115943"
depends=('kdebase-workspace')
makedepends=('cmake' 'make' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/115943-mountoid-${pkgver}.tar.gz)
license=('GPL')
md5sums=('17422a08bcbe8f43a15d909f895bfe0c')

build() {
  cd $srcdir/mountoid
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make VERBOSE=1 || return 1
  make DESTDIR=$pkgdir install || return 1
}
