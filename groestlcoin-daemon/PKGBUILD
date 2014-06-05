# Maintainer: Dylan <dylan@hashflo.net>

pkgname='groestlcoin-daemon'
pkgver=2.1.0.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.groestlcoin.org/"
makedepends=('boost' 'miniupnpc')
license=('MIT')
source=("https://github.com/GroestlCoin/GroestlCoin/archive/master.tar.gz"
        "groestlcoind@.service"
)

sha256sums=('SKIP'
            '94c7a66a1fa2bbb5e33b820653b51bf3660517275d27ccb74e3b2e233d3f5269')

pkgdesc="Peer-to-peer network based digital currency (daemon)."
depends=(boost-libs miniupnpc openssl)
conflicts=(groestlcoin)

build() {
  cd "$srcdir/GroestlCoin-master"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  install -Dm644 groestlcoind@.service "$pkgdir/usr/lib/systemd/system/groestlcoind@.service"
  cd "$srcdir/GroestlCoin-master"
  install -Dm755 src/GroestlCoind "$pkgdir"/usr/bin/groestlcoind
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

