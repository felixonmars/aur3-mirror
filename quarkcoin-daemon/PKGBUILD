# Maintainer: Dylan Ferris <acerix at kanux dot dom>

pkgname='quarkcoin-daemon'
pkgver=0.8.3
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.qrk.cc/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
source=("https://github.com/MaxGuevara/quark/archive/master.tar.gz"
        "quarkcoind@.service"
)
sha256sums=(SKIP
            'dbf08ab523eadaa652208676815d40ba196aaac1dcf47efe4fdce71dffd4cd77')
pkgdesc="Peer-to-peer network based digital currency (daemon)"
depends=(boost-libs miniupnpc openssl)

build() {
  cd "$srcdir/quark-master"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  install -Dm644 quarkcoind@.service "$pkgdir/usr/lib/systemd/system/quarkcoind@.service"
  cd "$srcdir/quark-master"
  install -Dm755 src/quarkcoind "$pkgdir"/usr/bin/quarkcoind
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

