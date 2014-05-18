# Maintainer: Viliam Kubis <viliam dot kubis at gmail dot com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>

pkgname='marucoin-git'
_gitname='MaruCoin'
pkgver=0.9.1.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.marucoin.com/"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'git')
license=('MIT')
pkgdesc="Next Generation CryptoCurrency. (includes both the qtclient and the headless daemon)"
provides=(marucoin)
conflicts=(marucoin)
source=("git://github.com/MaruCoinOfficial/MaruCoin.git")
md5sums=('SKIP')

build() {
	cd "${_gitname}"
	cd "$srcdir/$_gitname"

	# make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1
	make

	# make marucoin daemon
	cd "$srcdir/$_gitname/src"
	make $MAKEFLAGS -f makefile.unix
}


package() {
	# install marucoin-qt client
	install -D -m755 "$srcdir/$_gitname/marucoin-qt" "$pkgdir/usr/bin/marucoin-qt"

	# install marucoin daemon
	install -D -m755 "$srcdir/$_gitname/src/marucoind" "$pkgdir/usr/bin/marucoind"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

