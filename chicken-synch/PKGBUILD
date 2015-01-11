# Maintainer: Aaron P <aaronbpaden@gmail.com>
# Contributer: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-synch
_pkgname=synch
pkgver=2.1.2
pkgrel=1
pkgdesc="Chicken Scheme Egg: Synchronization Forms"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/synch"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors' )
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"
	chicken-install -r "${_pkgname}":"${pkgver}"
}

package() {
	cd "$_pkgname"
	CHICKEN_INCLUDE_PATH=/usr/lib/chicken/7/ chicken-install -p "$pkgdir/usr"
}
