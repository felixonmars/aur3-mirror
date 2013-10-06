# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>

srcname='deriving'
pkgname="ocaml-${srcname}"-git
pkgver=0.5.8.gac5f647
pkgver(){
    cd $pkgname
    git describe --tags --long | sed 's/-/./g'
}
pkgrel=1
pkgdesc='Extension to OCaml for deriving functions from type declarations'
arch=('i686' 'x86_64')
url='https://github.com/hnrgrgr/deriving'
license=('MIT')
depends=('ocaml' 'ocaml-type-conv' 'ocaml-optcomp')
makedepends=('ocaml-findlib' )
options=('!strip')
provides=('ocaml-deriving')
source=("$pkgname::git://github.com/hnrgrgr/deriving.git")

build() {
  cd "$pkgname"
  env DESTDIR="$pkgdir" \
    OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
    make
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  cd $pkgname
  env DESTDIR="$pkgdir" \
    OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
    make install
}
md5sums=('SKIP')
