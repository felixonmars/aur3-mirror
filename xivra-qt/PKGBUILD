# Maintainer: Henrik Andersson <henrik dot nacka at gmail dot com>

pkgname='xivra-qt'
pkgver=0.8.6.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.xivra.com/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs qt4 miniupnpc qrencode)
conflicts=(xivra)
install=xivra-qt.install
source=("http://www.xivra.com/downloads/Xivra-master.zip"
        "$pkgname.desktop")
sha256sums=('77638fc98c90416343e000400a388ae875bce84bdb35457d3ebc986364912d48'
            '1f44b9e94419dbcd7cf8e837e1cb1dcf54133ca80ec9218aaa1fc6a416572f21')

build() {
  cd "$srcdir/Xivra-master"

  # and make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}


package() {
  install -Dm644 xivra-qt.desktop "$pkgdir"/usr/share/applications/xivra.desktop
  cd "$srcdir/Xivra-master"
  install -Dm755 xivra-qt "$pkgdir"/usr/bin/xivra-qt
  install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/xivra.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

