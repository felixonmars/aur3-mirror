# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-srfi-78
_pkgname=srfi-78
pkgver=1.0
pkgrel=5
pkgdesc="Chicken Scheme Egg: SRFI-78: Lightweight testing"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-78"
license=('custom:SRFI')
depends=('chicken>=4.5.0' 'chicken-srfi-42' )
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"			
	chicken-install -r "$_pkgname"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
