# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-static-modules
_pkgname=static-modules
pkgver=1.8
pkgrel=5
pkgdesc="Chicken Scheme Egg: ML-style module system for statically-typed languages."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/static-modules"
license=('GPL3')
depends=('chicken>=4.5.0' 'chicken-datatype' )
options=(docs !libtool !emptydirs)

build() {
	cd "$srcdir/"			
	chicken-install -r "$_pkgname"
}

package() {
	cd "$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
