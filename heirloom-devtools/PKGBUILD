# Contributor: Jens Staal <staal1978@gmail.com>
# $Id: PKGBUILD,v 1.13 2010/12/17 21:45:33 andres Exp $

pkgname="heirloom-devtools"
pkgver=070527
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Development tools (yacc, lex, make ...) derived from original UNIX tools"
url="http://heirloom.sourceforge.net/devtools.html"
license=('BSD' 'CDDL')
depends=('heirloom-sh')
conflicts=("$pkgname-cvs")
source=("http://sourceforge.net/projects/heirloom/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
	'000-config.diff')
md5sums=('a777644467001a23da024ce66017045d'
         '23e6c36716a6dac04fa947701c074a57')

build() {
	cd "$pkgname-$pkgver"
	
	patch -p1 < ../000-config.diff

	make
}

package() {
	cd "$pkgname-$pkgver"

	make install ROOT="$pkgdir"

	install -Dm644 LICENSE/BERKELEY.LICENSE \
		"$pkgdir"/usr/share/licenses/"$pkgname"/BERKELEY
	install -Dm644 LICENSE/CALDERA.LICENSE \
		"$pkgdir"/usr/share/licenses/"$pkgname"/CALDERA
}
