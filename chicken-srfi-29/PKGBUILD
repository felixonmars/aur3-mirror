# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-srfi-29
_pkgname=srfi-29
pkgver=2.3.2
pkgrel=1
pkgdesc="Chicken Scheme Egg: Localization"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-29"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-miscmacros' 'chicken-lookup-table>=1.13.1' 'chicken-locale>=0.6.5' 'chicken-check-errors>=1.12.0' 'chicken-condition-utils>=1.0.0' 'chicken-variable-item' 'chicken-posix-utils')

build() {
  cd "$srcdir/"
  chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
  cd "$_pkgname"
  chicken-install -p "$pkgdir/usr"
}
