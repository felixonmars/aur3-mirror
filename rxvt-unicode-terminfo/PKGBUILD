# Maintainer: Markus Jochim <ich@markusjochim.de>
# Contributor: Markus Jochim <ich@markusjochim.de>
pkgname=rxvt-unicode-terminfo
pkgver=9.15
pkgrel=1
pkgdesc='Terminfo file for urxvt, useful for servers that need the file but not the terminal'
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
arch=(any)
license=(GPL)
conflicts=(rxvt-unicode)
makedepends=(ncurses)
source=("http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-$pkgver.tar.bz2")
md5sums=('15595aa326167ac5eb68c28d95432faf')

build() {
	install -m 755 -d ${pkgdir}/usr/share/terminfo/r/

	cd ${srcdir}/rxvt-unicode-${pkgver}/doc/etc/
	umask 022
	tic -o${pkgdir}/usr/share/terminfo/ rxvt-unicode.terminfo
}

# vim:set ts=4 sw=2 noet:
