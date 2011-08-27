# Contributor: Jens Staal <staal1978@gmail.com>
# $Id: PKGBUILD,v 1.13 2010/12/17 21:45:33 andres Exp $

pkgname="heirloom"
pkgver=070715
pkgrel=4
pkgdesc="Standard UNIX utilities, derived from original UNIX tools"
arch=('i686' 'x86_64')
url="http://heirloom.sourceforge.net/tools.html"
license=('BSD' 'GPL' 'CDDL' 'LGPL' 'custom:"Lucent Public License"' 'custom:"zlib License"')
depends=('heirloom-sh')
makedepends=('bc' 'heirloom-devtools')
conflicts=("$pkgname-cvs")
source=("http://sourceforge.net/projects/heirloom/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
	'000-config.diff' '001-staticdep.diff' '002-nowhat.diff')
md5sums=('d846be4b268b1d55b6ffcef847f09979'
         '97b11aef3be7f05b01b0ee7f83e37ac9'
         '115355b6058592f9ba16a1c011f27ecd'
         '7394fc957b4fe5a58e4f43d7e283e96b')

_hmake() {
	env PATH="/usr/heirloom/bin:$PATH" MAKEFLAGS="" make "$@"
}

build() {
	cd "$pkgname-$pkgver"

	patch -p1 < ../000-config.diff
	patch -p1 < ../001-staticdep.diff
	patch -p1 < ../002-nowhat.diff

	_hmake
}

package() {
	cd "$pkgname-$pkgver"

	_hmake install ROOT="$pkgdir"

	install -Dm644 LICENSE/LICENSE \
		"$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
	install -Dm644 LICENSE/LUCENT \
		"$pkgdir"/usr/share/licenses/"$pkgname"/LUCENT
}
