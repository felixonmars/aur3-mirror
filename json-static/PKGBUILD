#Contributor: Sergey Plaksin <radzevich.belevich at gmail.com>

pkgname=json-static
pkgver=0.9.8
pkgrel=1
pkgdesc="A syntax extension of OCaml that can make the use of JSON data easier"
arch=('i686' 'x86_64')
url="http://martin.jambon.free.fr/json-static.html"
license=('AS IS')
depends=('ocaml' 'ocaml-findlib' 'json-wheel')
source=(http://martin.jambon.free.fr/$pkgname-$pkgver.tar.gz)
md5sums=('d45e22d4594ca3d7642243f2e275ac29')

build() {
  cd $srcdir/$pkgname-$pkgver
  make all || return 1
  mkdir -p $pkgdir$(ocamlfind printconf destdir)/$pkgname
  make OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)" install || return 1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
