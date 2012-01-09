# Maintainer: Gregory BELLIER <gregory.bellier -- gmail -- com>
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

pkgname=ocaml-fdinfo
pkgver=0.3.1
pkgrel=1
pkgdesc="OCaml library to get infos on files opened by another processus "
arch=('i686' 'x86_64')
url="http://gatekeeper.fr"
license=('MIT')
makedepends=('ocaml ocaml-findlib')
options=('!strip')
install=
source=(http://gatekeeper.fr/tarball/ocaml-fdinfo/ocaml-fdinfo_$pkgver.tar.gz)
md5sums=('bc4d776f7feb39e9fec2caeca8e83df6')

build() { 

  cd "$srcdir/ocaml-fdinfo_$pkgver"

  make || return 1
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -d $OCAMLFIND_DESTDIR/fdinfo/ || return 1

  OCAMLDESTDIR="$OCAMLFIND_DESTDIR" make install || return 1

}

# vim:set ts=2 sw=2 et:

