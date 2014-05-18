# Maintainer: Viliam Kubis <viliam dot kubis at gmail dot com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>

pkgname='myriadcoin-git'
_gitname='myriadcoin'
pkgver=0.8.99.9
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.myriadcoin.org/"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'git')
license=('MIT')
pkgdesc="A coin for everyone. (includes both the qtclient and the headless daemon)"
provides=(myriadcoin)
conflicts=(myriadcoin)
source=("git://github.com/myriadcoin/myriadcoin.git")
md5sums=('SKIP')

build() {
	cd "${_gitname}"
	cd "$srcdir/$_gitname"

	# make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1
	make

	# make myriadcoin daemon
	cd "$srcdir/$_gitname/src"
	make $MAKEFLAGS -f makefile.unix
}


package() {
	# install myriadcoin-qt client
	install -D -m755 "$srcdir/$_gitname/myriadcoin-qt" "$pkgdir/usr/bin/myriadcoin-qt"

	# install myriadcoin daemon
	install -D -m755 "$srcdir/$_gitname/src/myriadcoind" "$pkgdir/usr/bin/myriadcoind"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

