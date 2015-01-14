# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-locale
_pkgname=locale
pkgver=0.6.13
pkgrel=1
pkgdesc="Chicken Scheme Egg: Provides locale operations"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/locale"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-regex' 'chicken-setup-helper'
	 'chicken-miscmacros' 'chicken-record-variants' 'chicken-synch'
	 'chicken-lookup-table')
options=(docs !libtool !emptydirs)

build() {
  cd "$srcdir/"
  chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
  cd "$_pkgname"
  chicken-install -p "$pkgdir/usr"
}
