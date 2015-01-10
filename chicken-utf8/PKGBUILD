# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-utf8
_pkgname=utf8
pkgver=3.3.9
pkgrel=2
pkgdesc="Chicken Scheme Egg: Unicode support"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/utf8"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-iset' 'chicken-make' 'chicken-regex')
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
