# Contributor: rxvt <artwithin@gmail.com>

pkgname=ifstat
pkgver=1.1
pkgrel=1
pkgdesc="ifstat is a tool to report network interfaces bandwith just like vmstat/iostat do for other system counters."
url="http://gael.roualland.free.fr/ifstat/"
license="GPL"
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://gael.roualland.free.fr/ifstat/$pkgname-$pkgver.tar.gz)
md5sums=('b655642c33a626cfe976792fbcd9b6e1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-optim
  make || return 1
  make prefix=$startdir/pkg/usr install
}
