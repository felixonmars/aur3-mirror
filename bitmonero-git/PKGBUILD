# Maintainer: Viliam Kubis <viliam dot kubis at gmail dot com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>

pkgname='bitmonero-git'
_gitname='bitmonero'
pkgver=0.8.8.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.monero.cc/"
depends=('boost-libs>=1.46' 'miniupnpc>=1.6')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'git')
license=('MIT')
pkgdesc="Monero (XMR) is a new privacy-centric coin using the CryptoNote protocol. Monero is not a fork of Bitcoin. Package provides bitmonerod, bitmonerosimplewallet, bitmonerosimpleminer and bitmoneroconnectivity_tool."
provides=(bitmonero)
conflicts=(bitmonero)
source=("git://github.com/monero-project/bitmonero.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_gitname"

	make $MAKEFLAGS
}


package() {
	# install bitmonero daemon
	install -D -m755 "$srcdir/$_gitname/build/release/src/bitmonerod" "$pkgdir/usr/bin/bitmonerod"

	# install simplewallet
	install -D -m755 "$srcdir/$_gitname/build/release/src/simplewallet" "$pkgdir/usr/bin/bitmonerosimplewallet"

	# install simpleminer
	install -D -m755 "$srcdir/$_gitname/build/release/src/simpleminer" "$pkgdir/usr/bin/bitmonerosimpleminer"

	# install connectivity_tool
	install -D -m755 "$srcdir/$_gitname/build/release/src/connectivity_tool" "$pkgdir/usr/bin/bitmoneroconnectivity_tool"
}

