# Maintainer: François Lebigre <francois.lebigre@gmail.com>
pkgname=camelis
pkgver=1.4.3
pkgrel=4
pkgdesc="An implementation of Logical Information Systems (LIS)."
arch=(i686 x86_64)
url="http://www.irisa.fr/LIS/ferre/camelis/index.html"
license=('GPL')
depends=('ocaml>=3.08' 'lablgtk2' 'ocaml-xml-light' 'ocaml-mp3id3' 'logfun')
optdepends=('jhead: utility program for the JPEG transducer')
source=(http://www.irisa.fr/LIS/ferre/camelis/download/$pkgname-$pkgver-src.tar.gz)
md5sums=('bcbb55938b36bfe4c6feff7ba3b5c253')

build() {
	cd "$srcdir/$pkgname-$pkgver-src"

	make INCLUDES="-I +lablgtk2 -I +site-lib/mp3id3 -I +logfun -I common -I source -I well -I interface -I +xml-light" all
	
}

package() {
	cd "$srcdir/$pkgname-$pkgver-src"

	mkdir -p $pkgdir$(ocamlc -where)
	make CAMLLIB=$pkgdir$(ocamlc -where) install
}

