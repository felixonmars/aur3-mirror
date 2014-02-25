# Maintainer: <dx /dot/ 1178 at gmail /dot/ com>
#
pkgname=digitalcoin-git
_gitname=digitalcoin
pkgver=1.1
pkgrel=4
pkgdesc="Transparent and open cryptocurrency."
arch=('x86_64' 'i686')
url="http://digitalcoin.co/"
license=('MIT')
provides=('digitalcoin-qt')
conflicts=('digitalcoin-qt' 'digitalcoind-git')
depends=('qt4' 'miniupnpc' 'qrencode' 'boost-libs')
makedepends=('git' 'boost' 'gcc' 'make')
source=('git://github.com/baritus/digitalcoin'
        'digitalcoin.desktop')
install=digitalcoin.install
sha256sums=(SKIP 
            '412abfb7282ec9943ea59d55dba306bbbf9dc47e780fd17fa47c1222ab0bdbe7')

## files & commands for building
_makefile_unix=makefile.unix

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${_gitname}/

	# build digitalcoin-qt
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1
	make $MAKEFLAGS
}

package() {
	install -Dm644 digitalcoin.desktop ${pkgdir}/usr/share/applications/digitalcoin.desktop

	cd ${_gitname}
	install -Dm755 digitalcoin-qt ${pkgdir}/usr/bin/digitalcoin-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png ${pkgdir}/usr/share/pixmaps/digitalcoin.png
}

