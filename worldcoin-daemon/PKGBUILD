# Maintainer: Dylan <dylan at hashflo dot net>

pkgname='worldcoin-daemon'
pkgver=0.8.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://worldcoinfoundation.org/"
makedepends=('boost' 'miniupnpc')
license=('MIT')
source=("https://github.com/worldcoinproject/worldcoin-v0.8/archive/$pkgver-dev.tar.gz"
        "worldcoind@.service"
)

sha256sums=('SKIP'
            '4c54c7ba885d37e161456d8c220edefee4cf55083d4aaab1f97e742765d62bf4')

pkgdesc="Peer-to-peer network based digital currency (daemon)"
depends=('boost-libs' 'miniupnpc<1.9' 'openssl')

build() {
  cd "$srcdir/worldcoin-v0.8-$pkgver-dev"

  # sorry about this hack, please let me know if there is a better way to get this to build
  cp -r /usr/include/miniupnpc/* src/obj/

  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  install -Dm644 worldcoind@.service "$pkgdir/usr/lib/systemd/system/worldcoind@.service"
  cd "$srcdir/worldcoin-v0.8-$pkgver-dev"
  install -Dm755 src/worldcoind "$pkgdir"/usr/bin/worldcoind
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

