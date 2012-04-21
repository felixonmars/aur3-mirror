# Maintainer: Tom Kazimiers <tom AT voodoo-arts.net>

pkgname=ocaml-syck
pkgver=0.1.1
pkgrel=1
pkgdesc="OCaml bindings to the Syck YAML parsing library"
arch=('i686' 'x86_64')
license=('MIT')
depends=('ocaml' 'syck')
makedepends=('ocaml syck')
options=(!strip !makeflags)
url='http://sourceforge.net/projects/ocaml-syck/'
source=("http://sourceforge.net/projects/ocaml-syck/files/ocaml-syck/ocaml-syck-$pkgver/ocaml-syck-$pkgver.tar.gz")
md5sums=('14672035c97dc50c15acb7c936f029c3')

build() {
  cd "$srcdir/ocaml-syck-$pkgver"
  env CPPFLAGS=-fPIC ./configure --prefix /usr
  make
}

package() {
  cd "$srcdir/ocaml-syck-$pkgver"
  export DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_DESTDIR="$DESTDIR"
  mkdir -p $OCAMLFIND_DESTDIR

  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"

  cd yaml
  # DESTDIR and OCAMLFIND_DESTDIR are needed by ocamlfind
  ocamlfind install syck META *.cmx *.cmi *.cmxa *.a *.so *.mli
  echo "Note: the warning of ocamlfind about installing to a directory that is unknown to ld can safely be ignored"
  # The .so.owner files are not needed here -- we already have packet management
  rm $OCAMLFIND_DESTDIR/stublibs/*.so.owner
}
