# Maintainer: Sid Karunaratne <sakaru at gmail dot com>

pkgname=tcpurify
pkgver=0.11.2
pkgrel=1
pkgdesc="like tcpdump, but designed from the ground up to protect the privacy of users on the sniffed network as much as possible"
url="http://irg.cs.ohiou.edu/~eblanton/tcpurify/"
license=('GPL2')
arch=('i686' 'x86')
depends=('libpcap')
source=(http://irg.cs.ohiou.edu/~eblanton/tcpurify/${pkgname}-${pkgver}.tar.gz)
sha256sums=('9822f88125e912c568de23b04cee7c84452eefa27a80dcaeaeb001f87cb60e99')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  mkdir -p "$pkgdir/bin"
  install -m 755 "$srcdir/${pkgname}-${pkgver}/${pkgname}" "$pkgdir/bin/"
}
