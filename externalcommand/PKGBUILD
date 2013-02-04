# Maintainer: Andy Pieters <ExternalCommand@AndyPieters.me.uk>
packager="Andy Pieters <ExternalCommand@AndyPieters.me.uk>"
pkgname=externalcommand
pkgver=1.0.0
pkgrel=1
pkgdesc="plasma wallpaper plugin that periodically calls an external command to get the next wallpaper"
arch=('i686' 'x86_64')
url="http://externalcommand.sourceforge.net"
license=GPLV3
source=(http://sourceforge.net/projects/externalcommand/files/${pkgver}/ExternalCommand-${pkgver}-${pkgrel}.tar.bz2/download)
depends=(kdebase-workspace)
makedepends=('cmake' 'automoc4')
install=ExternalCommand.install
sha1sums=(c66e1f6fa7614b76fbba0873efd6ba71244fa0cf)

build() {
  cd $srcdir/ExternalCommand-$pkgver-$pkgrel/
  [ -d build ] && rm --preserve-root --one-file-system -rf build
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $srcdir/ExternalCommand-$pkgver-$pkgrel/build
  make DESTDIR="${pkgdir}" install
}
