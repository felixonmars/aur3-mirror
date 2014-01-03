# Maintainer: Dylan Ferris <acerix at kanux dot dom>

pkgname='mooncoin-daemon'
pkgver=0.8.6.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://mooncoin.info/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
source=("https://github.com/realmooncoin/mooncoin/archive/master.tar.gz"
        "mooncoind@.service"
)
sha256sums=(SKIP
            '605b21bcb226663d33fa44f239939b67a5c3ee2eb3aa1eab1ccad28fca28b000')
pkgdesc="Peer-to-peer network based digital currency (daemon)"
depends=(boost-libs miniupnpc openssl)
conflicts=(mooncoin)

build() {
  cd "$srcdir/mooncoin-master"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  install -Dm644 mooncoind@.service "$pkgdir/usr/lib/systemd/system/mooncoind@.service"
  cd "$srcdir/mooncoin-master"
  install -Dm755 src/mooncoind "$pkgdir"/usr/bin/mooncoind
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

