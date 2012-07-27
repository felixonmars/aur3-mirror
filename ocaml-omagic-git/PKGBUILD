# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-omagic-git
pkgver=20120119
pkgrel=4
pkgdesc="OCaml bindings to libmagic"
arch=('i686' 'x86_64')
url=("http://github.com/ftrvxmtrx/omagic")
# MIT + linking exception
license=('MIT')
depends=('ocaml' 'ocaml-findlib')
makedepends=('ocaml')
provides=('ocaml-omagic')
conflicts=('ocaml-omagic')

_gitroot="git://github.com/ftrvxmtrx/omagic.git"
_gitname="omagic"

build () {
  cd "$srcdir"

  msg "Connecting to GIT server..."

  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --docdir "$pkgdir/usr/share/doc/ocaml-omagic" || return 1
  make all doc || return 1
}

package () {
  destdir="${pkgdir}$(ocamlfind printconf destdir)"

  cd "$srcdir/$_gitname-build"

  mkdir -p "${destdir}/stublibs"
  OCAMLFIND_DESTDIR="${destdir}" make install || return 1
}
