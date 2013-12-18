# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-lalr
_pkgname=lalr
pkgver=2.4.3
pkgrel=5
pkgdesc="Chicken Scheme Egg: An efficient LALR(1) parser generator"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/lalr"
license=('GPL')
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
