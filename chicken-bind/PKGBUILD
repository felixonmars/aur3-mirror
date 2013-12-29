#submitter: perlawk

pkgname=chicken-bind
_pkgname=bind
pkgver=1.52
pkgrel=1
pkgdesc="Chicken Scheme Egg: Automatically generate bindings from C/C++ declarations"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/bind"
license=('public')
depends=('chicken>=4.5.0' 'chicken-silex' 'chicken-matchable' 'chicken-coops' )
install=

build() {
	cd "$srcdir"
	if [ ! -e "$_pkgname" ]; then
		chicken-install -r "$_pkgname"
	fi
}

package() {
	cd "$srcdir/$_pkgname"
	chicken-install -p "$pkgdir/usr"
}
