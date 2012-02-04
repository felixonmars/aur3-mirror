# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Based on community package: darktable

pkgname=darktable-no-gconf
pkgver=0.9.3
_pkgver=0.9
pkgrel=1
pkgdesc="Utility to organize and develop raw images, with gconf disabled"
arch=('i686' 'x86_64')
url=http://darktable.sf.net/
license=('GPL3')
depends=('exiv2>=0.18' 'intltool>=0.40' 'lcms2' 'lensfun>=0.2.3' 'libglade' 'curl'
         'libgnome-keyring' 'libgphoto2' 'libusb-compat' 'openexr' 'sqlite3')
makedepends=('intltool>=0.40' 'cmake' 'sqlite3')
optdepends=( 'librsvg')
provides=('darktable')
conflicts=('darktable')
install=darktable.install
options=(!libtool)
source=(http://downloads.sourceforge.net/project/darktable/darktable/${_pkgver}/darktable-$pkgver.tar.gz)
md5sums=('49253a3a2990a4bf8e0b0a19295f19bd')

build() {
  cd $srcdir/darktable-$pkgver
  mkdir -p build
  cd build
  cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DDONT_INSTALL_GCONF_SCHEMAS=On \
      -DUSE_GCONF_BACKEND=Off \
      ..
  make
}

package() {
  cd $srcdir/darktable-$pkgver/build
  make DESTDIR=$pkgdir install
}

