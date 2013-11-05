# Maintainer: Bruno Jiménez <brunojimen@gmail.com>
# Based on terracoin-daemon PKGBUILD
#
# miniupnpc is a dependency needed for the UPnP port mapping
# for more information, please see:
# https://github.com/zetacoin/zetacoin/blob/master/doc/build-unix.md

pkgname='zetacoin-daemon-git'
pkgver=0.8.2.r218.g5eed859
pkgrel=1
arch=('i686' 'x86_64')
url="http://zeta-coin.org/"
makedepends=('boost' 'automoc4' 'miniupnpc')
license=('MIT')
pkgdesc="P2P decentralized digital currency with fast confirmation and no central issuer (daemon)"
depends=(boost-libs miniupnpc openssl)
source=("git://github.com/zetacoin/zetacoin.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/zetacoin"

  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/zetacoin"
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package() {
  cd "$srcdir/zetacoin"
  install -Dm755 src/zetacoind "$pkgdir"/usr/bin/zetacoind
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/zetacoin.conf"
  install -Dm644 contrib/debian/manpages/bitcoind.1 \
    "$pkgdir"/usr/share/man/man1/zetacoind.1
  install -Dm644 contrib/debian/manpages/bitcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/zetacoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

