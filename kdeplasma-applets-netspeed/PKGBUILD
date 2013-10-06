# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=kdeplasma-applets-netspeed
pkgver=0.2
pkgrel=2
pkgdesc="Simple plasmoid to show the current speed of a network interface and the overall statistics."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/netspeed-plasmoid?content=140504"
license=('LGPL')
depends=('kdelibs')
makedepends=('automoc4' 'cmake')
source=(http://sourceforge.net/projects/netspeed-plasma/files/${pkgver}/netspeed-plasma-${pkgver}.tar.gz)
md5sums=('ea165c8bcc11cc70495b23c91c161cc9')

prepare() {
  cd $srcdir
  mkdir build
  cd build
  cmake ../netspeed-plasma-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd $srcdir/build
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}