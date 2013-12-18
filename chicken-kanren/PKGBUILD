# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-kanren
_pkgname=kanren
pkgver=4.505
pkgrel=5
pkgdesc="Chicken Scheme Egg: A declarative applicative logic programming system."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/kanren"
license=('MIT')
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
