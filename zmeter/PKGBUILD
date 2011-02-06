# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=zmeter
pkgver=0.1.3
pkgrel=1
pkgdesc="Serial interface for the RadioShack 22-812 digital multimeter."
arch=('i686' 'x86_64')
url="http://zmeter.sourceforge.net"
depends=()
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz)
license=('GPL')
md5sums=('ed043cf8ace5de078be9f77f63f59602')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

