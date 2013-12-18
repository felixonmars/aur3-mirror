# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Maintainer: perlawk

pkgname=chicken-pstk
_pkgname=pstk
pkgver=1.2.2
pkgrel=5
pkgdesc="Chicken Scheme Egg: PS/Tk: Portable Scheme interface to Tk"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/pstk"
license=('public')
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
