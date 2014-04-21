# Maintainer: George Hilliard <gh403@msstate.edu>
pkgname=ptunnel
pkgver=0.72
pkgrel=3
pkgdesc="a tool for reliably tunneling TCP connections over ICMP echo request and reply packets"
arch=(i686 x86_64 armv6h)
url="http://www.cs.uit.no/~daniels/PingTunnel/#download"
license=('BSD')
depends=(libpcap)
makedepends=()
optdepends=()
install=
changelog=
source=(
        "http://www.cs.uit.no/~daniels/PingTunnel/PingTunnel-$pkgver.tar.gz"
        "ptunnel.service"
)
noextract=()
md5sums=(
         'c5f0c36d1a48d84ce7b5217f1ba52dd0'
         'd81e6db82c90362f0d273d1bd031c9fd'
)

build() {
  cd "$srcdir/PingTunnel"
  make
}

package() {
  install -D ptunnel.service "$pkgdir/usr/lib/systemd/system/ptunnel.service"
  cd "$srcdir/PingTunnel"
  install -D ptunnel "$pkgdir/usr/bin/ptunnel"
}

# vim:set ts=2 sw=2 et:
