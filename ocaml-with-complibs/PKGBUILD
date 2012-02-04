# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='ocaml'
pkgname="${srcname}-with-complibs"
pkgver=3.12.1
pkgrel=1
pkgdesc="A functional language with OO extensions (includes compiler libraries)"
arch=('i686' 'x86_64')
license=('LGPL2' 'custom: QPL-1.0')
url='http://caml.inria.fr/'
depends=('gdbm')
makedepends=('tk' 'ncurses>=5.6-7' 'libx11')
optdepends=('ncurses: advanced ncurses features' 'tk: advanced tk features')
provides=("ocaml=${pkgver}")
conflicts=('ocaml')
options=('!makeflags' '!strip')
source=("http://caml.inria.fr/distrib/ocaml-3.12/${srcname}-${pkgver}.tar.gz")
md5sums=('814a047085f0f901ab7d8e3a4b7a9e65')

build() {
  compiler_libs="${pkgdir}/usr/lib/ocaml/compiler-libs"

  cd "${srcdir}/${srcname}-${pkgver}"
  ./configure -prefix /usr
  make world.opt
  make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install

  # install compiler libraries
  mkdir -p "$compiler_libs"/{parsing,typing,utils}
  cp parsing/*.{cmi,cmo,cmx,ml,mli,mll,o} "$compiler_libs"/parsing
  cp typing/*.{cmi,cmo,cmx,ml,mli,o} "$compiler_libs"/typing
  cp utils/*.{cmi,cmo,cmx,ml,mli,o} "$compiler_libs"/utils

  # duplicated by installation
  rm "$compiler_libs"/typing/outcometree.{cmi,mli}

  # install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${srcname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${srcname}/"
}
