# Maintainer: Sergei Lebedev <superbobry@gmail.com>

pkgname=('ocaml-experimental')
pkgver=3.12.1+ocamlnatjit2
pkgrel=1
pkgdesc="OCaml with some experimental features"
arch=('i686' 'x86_64')
license=('LGPL2' 'custom: QPL-1.0')
url="http://benediktmeurer.de/ocaml-experimental/"
depends=('gdbm')
conflicts=('ocaml' 'ocaml-compiler-libs')
provides=('ocaml==3.12.1' 'ocaml-compiler-libs==3.12.1')
makedepends=('tk' 'ncurses>=5.6-7' 'libx11')
optdepends=('ncurses: advanced ncurses features'
            'tk: advanced tk features')
source=(http://benediktmeurer.de/files/source/ocaml-${pkgver}.tar.bz2)
md5sums=('159c293513ad70879009f922ed95070a')
options=('!makeflags' '!emptydirs')

build() {
  cd "${srcdir}/ocaml-${pkgver}"
  ./configure -prefix /usr
  make world.opt ocamlnat
}

package() {
  cd "${srcdir}/ocaml-${pkgver}"
  make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install

  # Save >10MB with this one, makepkg only strips debug symbols.
  #find ${startdir}/pkg/usr/lib -type f -name '*.so.*' -exec strip --strip-unneeded {} \;

  # Install compiler libraries
  local compiler_libs="${pkgdir}/usr/lib/ocaml/compiler-libs"
  mkdir -p "$compiler_libs"/{parsing,typing,utils}
  cp parsing/*.{cmi,cmo,cmx,ml,mli,mll,o} "$compiler_libs"/parsing
  cp typing/*.{cmi,cmo,cmx,ml,mli,o} "$compiler_libs"/typing
  cp utils/*.{cmi,cmo,cmx,ml,mli,o} "$compiler_libs"/utils
  # duplicated by installation
  rm -f "$compiler_libs"/typing/outcometree.{cmi,mli}

  # Install license
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
