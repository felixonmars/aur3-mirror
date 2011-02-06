# Contributor: galiyosha@gmail.com

pkgname=firecontrol
pkgver=0.2
pkgrel=1
pkgdesc="A simple console oriented tool based on libraw1394 to issue asynchronous read, write and lock requests to some nodes on the bus, force bus resets, and send PHY packets."
url="http://firecontrol.sourceforge.net"
license=('gpl')
depends=('libraw1394' 'readline')
makedepends=()
arch=('i686')
source=("http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e0f272ee4a72f214af3b06bfb81527ef')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
