# Maintainer: Dylan <dylan at hashflo dot net>

pkgname='teacoin-daemon'
pkgver=0.8.99.7
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.teacoin.net/"
makedepends=('boost' 'miniupnpc')
license=('MIT')
source=("https://github.com/teacoind/teacoin/archive/master.tar.gz"
        "teacoind@.service"
)

sha256sums=('SKIP'
            '584132ebd749d775418fbfdd4531c2de71477ddd5a808e021df171775048c705')

pkgdesc="Peer-to-peer network based digital currency (daemon)."
depends=(boost-libs miniupnpc openssl)

build() {
  cd "$srcdir/teacoin-master"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  install -Dm644 teacoind@.service "$pkgdir/usr/lib/systemd/system/teacoind@.service"
  cd "$srcdir/teacoin-master"
  install -Dm755 src/teacoind "$pkgdir"/usr/bin/teacoind
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

