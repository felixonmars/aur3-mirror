# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-miniml
_pkgname=miniml
pkgver=1.9
pkgrel=5
pkgdesc="Chicken Scheme Egg: Interpreter for a simple ML-like language."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/miniML"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-static-modules' 'chicken-datatype' 'chicken-silex' 'chicken-lalr' 'chicken-setup-helper')
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"			
	chicken-install -r "$_pkgname"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
