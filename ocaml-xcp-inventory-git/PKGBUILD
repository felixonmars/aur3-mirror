# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='xcp-inventory'
pkgname=ocaml-${srcname}-git
pkgver=0.9.0.3.g40d32f1
pkgver(){
    cd $pkgname
    git describe --tags --long | sed 's:xcp-inventory-::;s:-:.:g'
}
pkgrel=1
pkgdesc='A compiler of OCaml bytecode to Javascript'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml' ocaml ocaml-findlib ocaml-cmdliner ocaml-uuidm xen-api-libs)
makedepends=('ocaml-findlib')
provides=(ocaml-xcp-inventory)
options=('!strip')
source=("$pkgname::git://github.com/xapi-project/xcp-inventory")


build() {

    cd $pkgname
    ./configure --default_inventory=/etc/xensource-inventory
    make
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  cd $pkgname
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF=ignore
  make DESTDIR=$pkgdir/usr/lib/ocaml install

}
md5sums=('696e603c47c9e02554ab659b57d1da56')
md5sums=('SKIP')
