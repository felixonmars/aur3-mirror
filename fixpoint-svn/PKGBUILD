# Maintainer: Thibault Suzanne <thi [DOT] suzanne [AT] gmail [DOT] com>
# Category: science

pkgname='fixpoint-svn'
pkgver=2.3.2.r999
pkgrel=3
pkgdesc='Ocaml library implementing a generic fixpoint engine'
arch=('any')
url='http://pop-art.inrialpes.fr/people/bjeannet/bjeannet-forge/fixpoint/index.html'
license=('LGPL')
depends=('ocaml' 'camllib-svn' 'graphviz' 'camlidl')
makedepends=('svn' 'sed')
source=("$pkgname::svn://scm.gforge.inria.fr/svnroot/bjeannet/pkg/fixpoint/trunk")
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
      -e 's|^CAMLIDL_PREFIX *=.*$|CAMLIDL_PREFIX=/usr|' \
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

  cd "$srcdir/$pkgname"
  make install
}
