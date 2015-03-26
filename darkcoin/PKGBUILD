# Maintainer: Mitsu <archlinux AT suumitsu DOT eu>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='darkcoin'
pkgver=0.11.1.26
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.darkcoin.io/"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
pkgdesc="Privacy-Centric Cryptographic Currency with fully encrypted transactions and anonymous block transactions. (includes both the qtclient and the headless daemon)"
provides=(darkcoin)
conflicts=('darkcoin-git' 'darkcoin-bin-rc')

source=("https://github.com/darkcoinproject/darkcoin/archive/v$pkgver.tar.gz")
sha256sums=('6d5991ff599864f25ab8f16c8261624ce2fd9540d9e418d5a8890ea37f787c95')

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	./autogen.sh
	./configure --with-incompatible-bdb	# asks for 4.8, Arch has newer
	make $MAKEFLAGS -j $(nproc)

}


package() {
	install -D -m755 "$srcdir/$pkgname-$pkgver/src/qt/darkcoin-qt" "$pkgdir/usr/bin/darkcoin-qt"
	install -D -m755 "$srcdir/$pkgname-$pkgver/src/darkcoind" "$pkgdir/usr/bin/darkcoind"
	install -D -m755 "$srcdir/$pkgname-$pkgver/src/darkcoin-cli" "$pkgdir/usr/bin/darkcoin-cli"
	install -D -m644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 "$srcdir/$pkgname-$pkgver/share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/darkcoin128.png"
	install -D -m644 "$srcdir/$pkgname-$pkgver/contrib/debian/darkcoin-qt.desktop" "$pkgdir/usr/share/applications/darkcoin.desktop"
}



