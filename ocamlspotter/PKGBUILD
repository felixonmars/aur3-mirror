# Maintainer: libkenta <libkenta@gmail.com>

pkgname=ocamlspotter
pkgver=1.4.0
_ocamlver=3.12.1
pkgrel=1
pkgdesc='OCamlSpotter: OCaml source browsing'
arch=('i686' 'x86_64')
license=('LGPL2' 'custom: QPL-1.0')
url='http://jun.furuse.info/hacks/ocamlspotter'
depends=('gdbm')
makedepends=('tk' 'ncurses>=5.6-7' 'libx11')
optdepends=('ncurses: advanced ncurses features' 'tk: advanced tk features')
provides=('ocaml=3.12.1' 'ocaml-compiler-libs')
conflicts=('ocaml=3.12.1' 'ocaml-compiler-libs')
source=(https://bitbucket.org/camlspotter/mutated_ocaml/get/v${_ocamlver}-ocamlspot-${pkgver}.tar.gz)
md5sums=('ba25151396e75ea5d9ef454a3a987a1d')
options=('!makeflags' '!emptydirs')

build() {
  cd camlspotter-mutated_ocaml-* # XXX

  ./configure -prefix /usr
  make world world.opt
}

package() {
  cd camlspotter-mutated_ocaml-* # XXX

  make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install

  # Install compiler libraries
  local compiler_libs="${pkgdir}/usr/lib/ocaml/compiler-libs"
  mkdir -p "$compiler_libs"/{parsing,typing,utils}
  cp parsing/*.{cmi,cmo,cmx,ml,mli,mll,o} "$compiler_libs"/parsing
  cp typing/*.{cmi,cmo,cmx,ml,mli,o} "$compiler_libs"/typing
  cp utils/*.{cmi,cmo,cmx,ml,mli,o} "$compiler_libs"/utils
  # duplicated by installation
  rm -f "$compiler_libs"/typing/outcometree.{cmi,mli}

  # Install license
  install -m755 -d "${pkgdir}/usr/share/licenses/ocaml"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/ocaml/"

  # Uncomment if you want to install elisp for ocamlspotter
  #cd emacs
  #make EMACSDIR="$pkgdir/usr/share/emacs/site-lisp" install
}
