# Contributor: Daniel Leidisch <spam@leidisch.net>
# Updated by: Jens Staal <staal1978@gmail.com>
# $Id: PKGBUILD,v 1.14 2010/12/17 21:45:33 andres Exp $

pkgname="heirloom-doctools"
pkgver=080407
pkgrel=5
pkgdesc="Roff suite derived from OpenSolaris"
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/doctools.html"
license=('BSD' 'CDDL' 'LGPL' 'LPPL' 'custom:"Lucent Public License"')
makedepends=('heirloom-devtools')
depends=('heirloom-sh')
conflicts=("$pkgname-cvs")
source=("http://sourceforge.net/projects/heirloom/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
	'000-config.diff')
md5sums=('0fa9000c1508b793e533c6ffcaa0f647'
         '5594b9c124a9cb62de144f48be86087a')

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
	install -Dm644 LICENSE/LUCENT.LICENSE \
		"$pkgdir"/usr/share/licenses/"$pkgname"/LUCENT
}
