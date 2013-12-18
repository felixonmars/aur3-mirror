# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-datatype
_pkgname=datatype
pkgver=1.4
pkgrel=5
pkgdesc="Chicken Scheme Egg: A facility for creating and deconstructing variant records (from EOPL)"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/datatype"
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
