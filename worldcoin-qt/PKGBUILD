#Maintainer: ewhal4 <ewhal4 at live dot com>
pkgname=worldcoin-qt
pkgver=v0.8.6
pkgrel=1
pkgdesc="WorldCoin is designed to be the digital currency of the future."
arch=('x86_64' 'i686')
url="http://worldcoinfoundation.org/"
license=('MIT')
provides=('worldcoin-qt')
conflicts=('worldcoin' 'worldcoind-git')
depends=('boost-libs' 'qt4' 'miniupnpc' 'qrencode')
makedepends=('git' 'boost' 'gcc' 'make')
source=('git://github.com/worldcoinproject/worldcoin-v0.8'
        'worldcoin.desktop')
install=worldcoin.install
sha256sums=(SKIP
            'a6d31ea188486694e2571715eca93b6050e2b87ec7542f24cf645f118743d7e3')

build() {
  cd "$srcdir/worldcoin-v0.8"
  # and make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make
}

package() {
	install -Dm644 worldcoin.desktop ${pkgdir}/usr/share/applications/worldcoin.desktop

	cd "$srcdir/worldcoin-v0.8"
	install -Dm755 worldcoin-qt ${pkgdir}/usr/bin/worldcoin-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/worldcoin.png ${pkgdir}/usr/share/pixmaps/worldcoin.png
}

