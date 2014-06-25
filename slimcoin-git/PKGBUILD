# Maintainer: Viliam Kubis <viliam dot kubis at gmail dot com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>

pkgname='slimcoin-git'
_gitname='slimcoin'
pkgver=0.3.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.slimcoin.org/"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'git')
license=('MIT')
pkgdesc="Slimcoin (abbreviated SLM) is the first known cryptocurrency designed with a proof-of-burn block generation system along with both proof-of-work/proof-of-stake systems."
provides=(slimcoin)
conflicts=(slimcoin)
source=("git://github.com/slimcoin/slimcoin.git")
md5sums=('SKIP')

build() {
	cd "${_gitname}"
	cd "$srcdir/$_gitname"

	# make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1
	make

	# make slimcoin daemon
	cd "$srcdir/$_gitname/src"
	make $MAKEFLAGS -f makefile.unix
}


package() {
	# install slimcoin-qt client
	install -D -m755 "$srcdir/$_gitname/slimcoin-qt" "$pkgdir/usr/bin/slimcoin-qt"

	# install slimcoin daemon
	install -D -m755 "$srcdir/$_gitname/src/slimcoind" "$pkgdir/usr/bin/slimcoind"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

