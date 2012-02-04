# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: system
pkgname=lcd-stuff
pkgver=0.2.0
pkgrel=1
pkgdesc="Library to program and control the FTDI USB controller"
url="http://lcd-stuff.berlios.de"
license="GPL"
depends=('curl' 'libetpan' 'libnxml' 'libmrss' 'libmpd')
makedepends=('curl' 'libetpan' 'libnxml' 'libmrss' 'libmpd' 'cmake')
arch=('i686' 'x86_64')
source=(http://download.berlios.de/lcd-stuff/$pkgname-$pkgver.tar.bz2 lcd-stuff)
md5sums=('29302f44f1f423d475b5a40cbd795adc'
         'c777e5848edad2007eee35f445198423')

build() {
  cd $startdir/src/$pkgname-$pkgver
  [ ! -d build ] && mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/rc.d
  install -m 755 $startdir/src/lcd-stuff $startdir/pkg/etc/rc.d
}
