# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-tiny-prolog
_pkgname=tiny-prolog
pkgver=2.0
pkgrel=5
pkgdesc="Chicken Scheme Egg: Tiny PROLOG interpreter."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/tiny-prolog"
license=('BSD')
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
