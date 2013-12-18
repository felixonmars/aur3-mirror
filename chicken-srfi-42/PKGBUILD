# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-srfi-42
_pkgname=srfi-42
pkgver=1.72
pkgrel=5
pkgdesc="Chicken Scheme Egg: SRFI-42 (Eager comprehensions)"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/srfi-42"
license=('custom:SRFI')
depends=('chicken>=4.5.0'  )
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"			
	chicken-install -r "$_pkgname"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
