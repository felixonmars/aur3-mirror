# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='message-switch'
pkgname="ocaml-${srcname}"
pkgver=0.10.0
pkgrel=1
pkgdesc='A compiler of OCaml bytecode to Javascript'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('FreeBSD')
depends=('ocaml'
ocaml-cohttp ocaml-rpc ocaml-xenstore
ocaml-ounit ocaml-syslog ocaml-uri
ocaml-re ocaml-rpc ocaml-cmdliner
ocaml-ssl ocaml-oclock
openssl )
makedepends=('ocaml-findlib')
options=('!strip')
source=("$pkgname::git://github.com/xapi-project/message-switch#tag=$pkgver")


build() {
    cd $pkgname

    ocaml setup.ml -configure --destdir $pkgdir/usr/lib/ocaml
    ocaml setup.ml -build
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

    cd $pkgname
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  ocaml setup.ml -install

}
md5sums=('696e603c47c9e02554ab659b57d1da56')
md5sums=('SKIP')
