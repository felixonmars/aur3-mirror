# Maintainer: François Lebigre <francois.lebigre@gmail.com>
pkgname=ocaml-mp3id3
pkgver=0.2.1
pkgrel=1
pkgdesc="OCaml library for reading MP3 tags"
arch=(i686 x86_64)
url="http://www.irisa.fr/LIS/ferre/camelis/downloads.html"
license=('GPL')
depends=('ocaml>=3.07')
makedepends=('ocaml-findlib')
source=(http://www.irisa.fr/LIS/ferre/camelis/download/$pkgname-$pkgver.tar.gz)
md5sums=('f0c551e587f0aaec370fbeccf05f95f6')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p $pkgdir$(ocamlfind printconf destdir)
	make OCAMLFIND_DESTDIR=$pkgdir$(ocamlfind printconf destdir) install
}

