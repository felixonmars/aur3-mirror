# Contributor Paolo Giangrandi <peoro.noob@gmail.com>
# Contributor: hpestilence <hpestilence@gmail.com>

pkgname=osgcal
pkgver=0.1.44
pkgrel=2
pkgdesc="The GPL version of cal3d to openscenegraph adapter dev environment."
url="http://mekensleep.org/index.php"
license=('GPL')
arch=('i686')
depends=('cal3d' 'sdl' 'libxml2' 'glib2' 'openscenegraph-uw')
makedepends=('pkgconfig')
conflicts=(osgcal2)
options=(!libtool)
source=(http://download.gna.org/underware/sources/$pkgname-$pkgver.tar.gz)
md5sums=('c6f43aa6014fc7fdc7cc0ab9e4b5a885')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i '1i #include <cstring>' src/osgCal/IOXFG.cpp
  sed -i '1i #include <cstring>' src/osgCal/HardwareModel.cpp
  sed -i '1i #include <cstring>' src/osgCal/SubMeshSoftware.cpp
  make || return 1
  make DESTDIR=$startdir/pkg install
}
