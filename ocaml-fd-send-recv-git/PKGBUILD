# Maintainer: Your Name <youremail@domain.com>
pkgname=ocaml-fd-send-recv-git
pkgver=1
pkgrel=1
pkgdesc="fd send recv"
arch=(i686 x86_64)
url="https://github.com/djs55/ocaml-fd-send-recv"
license=('LGPL')
makedepends=('git')
provides=(ocaml-fd-send-recv)
source=($pkgname::git://github.com/djs55/ocaml-fd-send-recv.git)
md5sums=('SKIP') #generate with 'makepkg -g'

build() {
  cd $pkgname
    ocaml setup.ml -configure --destdir $pkgdir/usr/lib/ocaml
    ocaml setup.ml -build
}

package() {
  cd $pkgname
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF=ignore
  ocaml setup.ml -install
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
