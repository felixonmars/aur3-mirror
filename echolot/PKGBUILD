pkgname=echolot
pkgver=0.1.0
pkgrel=2
pkgdesc="a packet sniffer that grabs ARP packets on any ethernet devices."
arch=('i686' 'x86_64')
url="http://echolot.sourceforge.net"
license=('custom')
depends=('libpcap')
source=(http://downloads.sourceforge.net/echolot/$pkgname-$pkgver.tar.gz)
md5sums=('5c751c11dd741b5484e0c6f107645b3a') 

build() {
  cd $srcdir/$pkgname-$pkgver

  install -d $pkgdir/usr/share/licenses/$pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir/ install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
