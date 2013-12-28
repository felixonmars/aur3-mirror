#submitter: perlawk

pkgname=chicken-leptonica
_pkgname=leptonica
pkgver=0.2
pkgrel=1
pkgdesc="An interface to the leptonica library of routines for image analysis and processing."
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/leptonica"
license=('GPL')
depends=('chicken>=4.5.0' 'libtiff' 'libpng' 'libjpeg-turbo')
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
