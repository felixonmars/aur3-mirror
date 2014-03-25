# Maintainer: Dylan <dylan@hashflo.net>

pkgname='hirocoin-daemon'
pkgver=0.8.6
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.hirocoin.org/"
makedepends=('boost' 'miniupnpc')
license=('MIT')
source=("https://github.com/HiroSatou/Hirocoin/archive/master-$pkgver.tar.gz"
        "hirocoind@.service"
)

sha256sums=('SKIP'
            '67e6f9038a1dd9a0f97f2224830bf21fa8a10bff884396630280f9d48867fe55')

pkgdesc="Peer-to-peer network based digital currency (daemon)."
depends=(boost-libs miniupnpc openssl)
conflicts=(hirocoin)

build() {
  cd "$srcdir/Hirocoin-master-$pkgver"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  install -Dm644 hirocoind@.service "$pkgdir/usr/lib/systemd/system/hirocoind@.service"
  cd "$srcdir/Hirocoin-master-$pkgver"
  install -Dm755 src/hirocoind "$pkgdir"/usr/bin/hirocoind
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

