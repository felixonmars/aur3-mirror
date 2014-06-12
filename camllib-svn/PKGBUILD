# Maintainer: Thibault Suzanne <thi [DOT] suzanne [AT] gmail [DOT] com>
# Category: science

pkgname='camllib-svn'
pkgver=1.3.0.r999
pkgrel=3
pkgdesc='OCaml library implementing various abstract datatypes inspired by the standard OCaml library'
arch=('any')
url='http://pop-art.inrialpes.fr/~bjeannet/bjeannet-forge/camllib/index.html'
license=('LGPL')
depends=('ocaml' 'ocaml-findlib')
makedepends=('svn' 'sed')
source=("$pkgname::svn://scm.gforge.inria.fr/svnroot/bjeannet/pkg/camllib/trunk")
md5sums=('SKIP')
options=('staticlibs' '!strip')

_DESTDIR=$(ocamlfind printconf destdir)
_LDCONF=$(ocamlfind printconf ldconf)


pkgver() {
    cd "$srcdir/$pkgname"
    local rel="$(sed -n 's|Release \([^ ]\+\) *$|\1|p' Changes | head -n 1)"
    local ver="$(svnversion)"
    printf "%s.r%s" "$rel" "${ver//[[:alpha:]]}"
}

prepare() {
    cd "$srcdir/$pkgname"
    sed \
      -e 's|^CAMLIDL_PREFIX|CAML_PREFIX|' \
      Makefile.config.model > Makefile.config


    # Set ocamlfind destdir
    sed \
      -e "s|\\$(OCAMLFIND) remove|\\$(OCAMLFIND) remove -destdir $pkgdir/$_DESTDIR -ldconf $pkgdir/$_LDCONF|g" \
      -e "s|\\$(OCAMLFIND) install|\\$(OCAMLFIND) install -destdir $pkgdir/$_DESTDIR -ldconf $pkgdir/$_LDCONF|g" \
      -i Makefile

}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
  mkdir -p $pkgdir$_DESTDIR
  touch $pkgdir$_DESTDIR/ld.conf

  cd "$srcdir/$pkgname"
  make install

  rm $pkgdir$_DESTDIR/ld.conf
}
