# Maintainer: Dylan <dylan at hashflo dot net>

pkgname='42coin-daemon'
pkgver=0.6.4.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://42coin.org/"
makedepends=('boost' 'miniupnpc')
license=('MIT')
source=("https://github.com/fourtytwo42/42/archive/master.tar.gz"
        "42coind@.service"
)

sha256sums=('SKIP'
            '5e10d7bd1fab3eddd822b0b7372b144d63f727aa2090fcaa689145b2a765bdbe')

pkgdesc="Peer-to-peer network based digital currency (daemon)"
depends=(boost-libs miniupnpc openssl)

build() {
  cd "$srcdir/42-master"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  install -Dm644 42coind@.service "$pkgdir/usr/lib/systemd/system/42coind@.service"
  cd "$srcdir/42-master"
  install -Dm755 src/42 "$pkgdir"/usr/bin/42coind
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

