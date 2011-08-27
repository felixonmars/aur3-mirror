#Contributor: Sergey Plaksin <radzevich.belevich at gmail.com>

libname=json-static

pkgname=ocaml-$libname
pkgver=0.9.8
pkgrel=2
pkgdesc="A syntax extension of OCaml that can make the use of JSON data easier"
arch=('i686' 'x86_64')
url="http://martin.jambon.free.fr/json-static.html"
license=('AS IS')
depends=('ocaml' 'ocaml-findlib' 'ocaml-json-wheel')
source=(http://martin.jambon.free.fr/json-static-$pkgver.tar.gz)
md5sums=('d45e22d4594ca3d7642243f2e275ac29')

build() {
  cd $srcdir/$libname-$pkgver
  make all || return 1
  mkdir -p $pkgdir$(ocamlfind printconf destdir)/$libname
  make OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)" install || return 1
	install -Dm 644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
