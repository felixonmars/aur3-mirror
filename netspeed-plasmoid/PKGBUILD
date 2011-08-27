# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=netspeed-plasmoid
pkgver=0.2
pkgrel=1
pkgdesc="Simple plasmoid to show the current speed of a network interface and the overall statistics."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/netspeed-plasmoid?content=140504"
license=('LGPL')
depends=('kdelibs')
makedepends=('automoc4')
source=(http://sourceforge.net/projects/netspeed-plasma/files/$pkgver/netspeed-plasma-$pkgver.tar.gz)
md5sums=('ea165c8bcc11cc70495b23c91c161cc9')


build() {
  cd $srcdir/netspeed-plasma-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make DESTDIR=$pkgdir install
}
