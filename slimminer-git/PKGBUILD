# Maintainer: Viliam Kubis <viliam dot kubis at gmail dot com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>

pkgname='slimminer-git'
_gitname='slimminer'
pkgver=2.3.4
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/slimcoin/slimminer"
depends=('boost-libs>=1.46')
makedepends=('boost' 'git')
license=('MIT')
pkgdesc="dcrypt CPU miner"
provides=(slimminer)
conflicts=(slimminer)
source=("git://github.com/slimcoin/slimminer.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_gitname"

	./autogen.sh
	./configure CFLAGS="-O3"
	make $MAKEFLAGS
}


package() {
	# install slimminer-qt client
	install -D -m755 "$srcdir/$_gitname/minerd" "$pkgdir/usr/bin/slimminerd"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

