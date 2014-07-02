# Maintainer: Viliam Kubis <viliam dot kubis at gmail dot com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>

pkgname='vericoin-git'
_gitname='master'
pkgver=1.2.4.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.vericoin.info/"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'git')
license=('MIT')
pkgdesc="Proof-of-Stake Verified. Proof-of-Work Distributed. Network-Stake-Dependent Interest."
provides=(vericoin)
conflicts=(vericoin)
source=("git://github.com/vericoin/master.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_gitname"

	# make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1
	make

	# make vericoin daemon
	cd "$srcdir/$_gitname/src"
	make $MAKEFLAGS -f makefile.unix
}


package() {
	# install vericoin-qt client
	install -D -m755 "$srcdir/$_gitname/vericoin-qt" "$pkgdir/usr/bin/vericoin-qt"

	# install vericoin daemon
	install -D -m755 "$srcdir/$_gitname/src/vericoind" "$pkgdir/usr/bin/vericoind"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

