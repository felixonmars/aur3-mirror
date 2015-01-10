# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-iset
_pkgname=iset
pkgver=1.9
pkgrel=3
pkgdesc="Chicken Scheme Egg: Integer sets"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/iset"
license=('BSD')
depends=('chicken>=4.5.0')
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
