# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-lookup-table
_pkgname=lookup-table
pkgver=1.13.5
pkgrel=1
pkgdesc="Chicken Scheme Egg: Simple Lookup Table"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/lookup-table"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors>=1.10.0' 'chicken-miscmacros' 'chicken-record-variants>=0.5' 'chicken-synch>=2.1.0' )
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
