# Maintainer: Thibault Suzanne <thi [DOT] suzanne [AT] gmail [DOT] com>
# Category: science

pkgname='mlgmpidl-svn'
pkgver=1.2.1.r315
pkgrel=4
pkgdesc='Interface to the GMP and MPFR libraries for OCaml'
arch=('any')
url='http://www.inrialpes.fr/pop-art/people/bjeannet/mlxxxidl-forge/mlgmpidl/'
license=('LGPL')
depends=('gmp>=5' 'mpfr>=3' 'ocaml' 'camlidl' 'ocaml-findlib')
makedepends=('svn' 'sed')
source=("$pkgname::svn://scm.gforge.inria.fr/svn/mlxxxidl/mlgmpidl/trunk")
md5sums=('SKIP')
options=('!strip' 'staticlibs')

_DESTDIR=$(ocamlfind printconf destdir)
_LDCONF=$(ocamlfind printconf ldconf)

pkgver() {
  cd "$srcdir/$pkgname"
  local rel="$(sed -n 's|Version \([^ ]*\):|\1|p' Changes | head -n 1)"
  local ver="$(svnversion)"
  printf "%s.r%s" "$rel" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"

  sed  \
    -e 's|^CAMLIDL_PREFIX *=.*$|CAMLIDL_PREFIX = /usr|' \
    -e "s|^OCAMLFIND *=.*$|OCAMLFIND=ocamlfind|" \
    Makefile.config.model > Makefile.config

  sed \
    -e "s|\\$(OCAMLFIND) remove|\\$(OCAMLFIND) remove -destdir $pkgdir/$_DESTDIR -ldconf $pkgdir/$_LDCONF|g" \
    -e "s|\\$(OCAMLFIND) install|\\$(OCAMLFIND) install -destdir $pkgdir/$_DESTDIR -ldconf $pkgdir/$_LDCONF|g" \
    -e 's|^LDFLAGS *=|LDFLAGS =-L$(CAMLIDL_PREFIX)/lib/ocaml/camlidl|' \
    -i Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  mkdir -p $pkgdir$_DESTDIR

  cd "$srcdir/$pkgname"
  make install
}
