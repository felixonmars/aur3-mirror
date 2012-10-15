# Maintainer: Duncan Townsend <duncant@mit.edu>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: shahid <helllamer@gmail.com>

pkgname=('bitcoin-daemon-electrum')
pkgver=0.6.3
pkgrel=1
pkgdesc="Bitcoin is a peer-to-peer network based digital currency - daemon patched for electrum server"
arch=('x86_64') # untested on i686
url="http://www.bitcoin.org/"
options=('strip')
depends=('boost-libs' 'miniupnpc' 'openssl')
makedepends=('boost' 'miniupnpc')
conflicts=('bitcoin' 'bitcoin-bin' 'bitcoin-git' 'bitcoin-daemon' 'bitcoin-qt')
replaces=('bitcoin' 'bitcoin-bin' 'bitcoin-git')
provides=("bitcoin=${pkgver}" "bitcoin-daemon=${pkgver}")
license=('MIT')
groups=('electrum' 'bitcoin')
source=("http://sourceforge.net/projects/bitcoin/files/Bitcoin/bitcoin-${pkgver}/bitcoin-${pkgver}-linux.tar.gz"
        "https://raw.github.com/spesmilo/electrum-server/master/patches/bitcoin-${pkgver}.diff")
sha256sums=('722d4209ff4a951a9eb5cae26a33ad62770fdcb5dfb5acf0b5c6a8f6f3a8a0ef'
            '0079784f2f219e62808970b34e721cc389d400bd278b1a3fa3c2eba03d0400a6')

build() {
  cd "$srcdir/bitcoin-$pkgver-linux/src"
  msg "Patching bitcoind for electrum"
  patch -p1 -i "${srcdir}/bitcoin-${pkgver}.diff"

  # make bitcoind
  make -f makefile.unix -C src CXXFLAGS="$CXXFLAGS" USE_UPNP=1
}

package_bitcoin-daemon-electrum() {
  cd "$srcdir/bitcoin-$pkgver-linux/src"
  install -Dm755 src/bitcoind "$pkgdir"/usr/bin/bitcoind
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 contrib/debian/manpages/bitcoind.1 \
    "$pkgdir"/usr/share/man/man1/bitcoind.1
  install -Dm644 contrib/debian/manpages/bitcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/bitcoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

