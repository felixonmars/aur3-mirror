pkgname=libgrip
pkgver=0.1.2
pkgrel=1
pkgdesc="Library allowing GTK+ application to use multitouch gestures"
arch=(i686 x86_64)
url="https://launchpad.net/libgrip"
license=(GPL)
depends=()
makedepends=()
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/grip-$pkgver.tar.gz)
build() {
  cd $srcdir/grip-$pkgver
	./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

md5sums=('aeb9499900a8a443551c7463af11ba16')
