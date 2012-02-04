# Contributor: Pranay Kanwar <warl0ck@metaeye.org>

pkgname=traceproto
pkgver=1.1.2beta1
pkgrel=1
pkgdesc="Multiprotocol traceroute, currently supports tcp, udp, and icmp. "
url="http://traceproto.sourceforge.net"
depends=('libnet' 'libpcap')
license="GPL"
arch=(i686)

source=(http://downloads.sourceforge.net/sourceforge/traceproto/$pkgname-$pkgver.tar.gz )

md5sums=('659d8e9edbddf121a42295800db28337')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
