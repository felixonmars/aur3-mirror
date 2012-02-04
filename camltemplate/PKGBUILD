#Contributor: Sergey Plaksin <radzevich.belevich at gmail.com>

pkgname=camltemplate
pkgver=1.0.2
pkgrel=1
pkgdesc="This is a template processor for Objective Caml."
arch=('i686' 'x86_64')
url="http://forge.ocamlcore.org/projects/camltemplate"
license=('GPL')
depends=('ocaml>=3.10' 'ocaml-findlib')
makedepends=('hevea')
source=(http://forge.ocamlcore.org/frs/download.php/29/$pkgname-$pkgver.tar.gz)
md5sums=('b2fec2070e2480d80752251953be1bd1')

build() {
  cd $srcdir/$pkgname-$pkgver/src
  sed -ie "s/install -destdir/install/" Makefile
  make all || return 1
  make opt || return 1
  mkdir -p $pkgdir$(ocamlfind printconf destdir)/$pkgname
  make OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)" install || return 1
  cd $srcdir/$pkgname-$pkgver/doc
  make htdoc || return 1
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  "cp" -r html/* $pkgdir/usr/share/doc/$pkgname
#install license
  cd $srcdir/$pkgname-$pkgver
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
