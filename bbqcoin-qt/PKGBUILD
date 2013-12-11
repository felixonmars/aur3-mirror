# Maintainer: Michael <ptchinster@archlinux.us>

pkgname='bbqcoin-qt'
pkgver=0.6.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://bbqcoinfoundation.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs qt4 miniupnpc qrencode)
conflicts=(bbqcoin)
install=bbqcoin-qt.install
source=("bbqcoin-qt.desktop" "bbqcoin-qt.install" "https://github.com/overware/BBQCoin/archive/master.zip")

md5sums=('182a3a6d4ca6f6086889c802b3d82e76'
         'bd7a597c9e5f32249e4c9a9ad55f2e12'
         'ed5ef08a1574928acb91aeba85ae3363')

build() {
  cd "$srcdir/BBQCoin-master"

  # and make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}


package() {
  install -Dm644 bbqcoin-qt.desktop "$pkgdir"/usr/share/applications/bbqcoin.desktop
  cd "$srcdir/BBQCoin-master"
  install -Dm755 bbqcoin-qt "$pkgdir"/usr/bin/bbqcoin-qt
  #install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/bbqcoin128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


