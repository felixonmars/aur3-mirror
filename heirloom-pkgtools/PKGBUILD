# Contributor: Daniel Leidisch <spam@leidisch.net>
# Updated by: Jens Staal <staal1978@gmail.com>
# $Id: PKGBUILD,v 1.14 2010/12/17 21:45:33 andres Exp $

pkgname="heirloom-pkgtools"
pkgver=070227
pkgrel=4
pkgdesc="SVR4 application packaging tools ported to Linux, as released by Sun"
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/pkgtools.html"
license=('BSD' 'CDDL')
makedepends=('heirloom-devtools')
depends=('heirloom-sh')
conflicts=("$pkgname-cvs")
source=("http://sourceforge.net/projects/heirloom/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
	'000-config.diff')
md5sums=('73573e701dce801ab4b25a5e38059d29'
         'ecc1692d04dd534fa374e1201984f9cd')

_hmake() {
	env PATH="/usr/heirloom/bin:$PATH" MAKEFLAGS="" make "$@"
}

build() {
	cd "$pkgname-$pkgver"
	
	patch -p1 < ../000-config.diff

	_hmake
}

package() {
	cd "$pkgname-$pkgver"

	_hmake install ROOT="$pkgdir"

	install -Dm644 LICENSE/CALDERA.LICENSE \
		"$pkgdir"/usr/share/licenses/"$pkgname"/CALDERA
}
