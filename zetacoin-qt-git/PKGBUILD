# Maintainer: Bruno Jiménez <brunojimen@gmail.com>
# Based on terracoin-qt PKGBUILD
#
# miniupnpc is a dependency needed for the UPnP port mapping
# for more information, please see:
# https://github.com/zetacoin/zetacoin/blob/master/doc/readme-qt.md#upnp-port-forwarding

pkgname='zetacoin-qt-git'
pkgver=0.8.2.r218.g5eed859
pkgrel=1
arch=('i686' 'x86_64')
url="http://zeta-coin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="P2P decentralized digital currency with fast confirmation and no central issuer (QT)"
depends=(boost-libs qt4 qrencode miniupnpc)
install=zetacoin-qt-git.install
source=("git://github.com/zetacoin/zetacoin.git"
        "zetacoin-qt.desktop")
sha256sums=(SKIP
            'e2b72cf2759bfc3a757e654d9b3a520c2c3c9aa643d31ce8b64436503594f463')

pkgver() {
  cd "$srcdir/zetacoin"

  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/zetacoin"
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}


package() {
  cd "$srcdir"
  install -Dm644 zetacoin-qt.desktop "$pkgdir"/usr/share/applications/zetacoin-qt.desktop
  cd "$srcdir/zetacoin"
  install -Dm755 zetacoin-qt "$pkgdir"/usr/bin/zetacoin-qt
  install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/zetacoin256.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

