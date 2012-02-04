# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='ocsigenserver'
pkgname="ocaml-${srcname}-dev"
pkgver=2.0_rc1
pkgrel=2
pkgdesc='An extensible Web server written in OCaml'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml' 'ocaml-ssl' 'ocamlnet' 'ocaml-react' 'ocaml-lwt' 'ocaml-cryptokit' 'ocaml-tyxml')
makedepends=('ocaml-findlib')
provides="ocaml-${srcname}"
conflicts="ocaml-${srcname}"
backup=("etc/${srcname}/${srcname}.conf")
options=('!strip')
install="${pkgname}.install"
source=("http://ocsigen.org/download/${srcname}-${pkgver//_/-}.tar.gz")
md5sums=('44c7c8f2bcef40cdb3c80d1e47198228')

build() {
  cd "$srcdir/${srcname}-${pkgver//_/-}"
  ./configure --prefix /usr \
              --temproot "$pkgdir" \
              --ocsigen-user root \
              --ocsigen-group root \
              --staticpagesdir "/srv/${srcname}"

  make
  make doc
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  cd "$srcdir/${srcname}-${pkgver//_/-}"
  make install
  make install.doc
}
