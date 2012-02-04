# Maintainer: Gregory BELLIER <gregory.bellier -- gmail -- com>
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

pkgname=ocaml-dbus
pkgver=0.30
pkgrel=1
pkgdesc="OCaml bindings for the D-Bus API"
arch=('i686' 'x86_64')
url="https://github.com/vincenthz/ocaml-dbus"
license=('LGPL')
makedepends=('ocaml' 'ocaml-findlib')
options=('!strip')
install=
source=(https://github.com/gbe/ocaml-dbus/tarball/$pkgver)
md5sums=('8426c8f359124557fda861d8d4b73732')

build() {

  cd "$srcdir/gbe-ocaml-dbus-bf27023"

  make all || return 1
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -d $OCAMLFIND_DESTDIR || return 1

  OCAMLDESTDIR=$OCAMLFIND_DESTDIR make install || return 1

}

# vim:set ts=2 sw=2 et:

