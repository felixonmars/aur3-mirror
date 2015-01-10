# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-ncurses
_pkgname=ncurses
pkgver=1.5
pkgrel=3
pkgdesc="Chicken Scheme Egg: An interface to the UNIX ncurses package"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/ncurses"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-easyffi' 'ncurses')
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
