#Maintainer Timendainum <timendainum@hotmail.com>

pkgname=friendshipcoin-qt
pkgver=v1.31
pkgrel=1
pkgdesc="Cryptocurrency"
arch=("x86_64" "i686")
url="http://www.friendshipcoins.com/"
license=("MIT")
provides=("friendshipcoin-qt")
depends=("qt4" "miniupnpc" "boost-libs")
#makedepends=("boost" "gcc" "make" "git")
makedepends=("boost" "automoc4" "qrencode" "miniupnpc")
source=("https://github.com/friendshipCoin/friendshipcoin/archive/$pkgver.tar.gz" 	"friendshipcoin-qt.desktop")
install=friendshipcoin.install


sha256sums=("0f2397b8afa3604b51e715079bf682f5bf9ba030274217bd2e72de70f37101ab"
           "4fa2926137aa2ea7809a853bf4e198d5921c034dc9257d26ee6f319423f0bdd5")
dirname=1.31

build() {
  cd "$srcdir/friendshipcoin-$dirname"

  # and make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}


package() {
  install -Dm644 friendshipcoin-qt.desktop "$pkgdir"/usr/share/applications/friendshipcoin-qt.desktop
  cd "$srcdir/friendshipcoin-$dirname"
  install -Dm755 friendshipcoin-qt "$pkgdir"/usr/bin/friendshipcoin-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/friendshipcoin128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

