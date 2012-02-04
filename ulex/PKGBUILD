# Maintainer: François Lebigre <francois.lebigre@gmail.com>
pkgname=ulex
pkgver=1.1
pkgrel=1
pkgdesc="lexer generator for Unicode and OCaml"
arch=(i686 x86_64)
url="http://www.cduce.org/download.html"
license=('MIT')
makedepends=('ocaml-findlib')
source=(http://www.cduce.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('ce49a013bc4a0e085977a9fe157017bf')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	make all
	make all.opt
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p $pkgdir$(ocamlfind printconf destdir)
	make OCAMLFIND_DESTDIR=$pkgdir$(ocamlfind printconf destdir) install
}

