# Contributor: lp76 <l.peduto@gmail.com>
pkgname=tcptrack
pkgver=1.4.2
pkgrel=1
pkgdesc="A sniffer which displays information about TCP connections it sees on a network interface"
arch=('i686' "x86_64")
url="http://www.rhythm.cx/~steve/devel/tcptrack/"
license=('GPL')
depends=('libpcap')
source=(http://www.rhythm.cx/~steve/devel/tcptrack/release/$pkgver/source/$pkgname-$pkgver.tar.gz)
md5sums=('dacf71a6b5310caf1203a2171b598610')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
