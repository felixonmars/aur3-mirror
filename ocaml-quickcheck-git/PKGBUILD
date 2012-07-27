# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-quickcheck-git
pkgver=20120727
pkgrel=1
pkgdesc="OCaml QuickCheck"
arch=('i686' 'x86_64')
url="https://github.com/camlunity/ocaml-quickcheck"
license=('LGPL')
depends=('ocaml' 'ocaml-findlib')
makedepends=('git')
provides=('ocaml-quickcheck')

_gitroot="git://github.com/camlunity/ocaml-quickcheck.git"
_gitname="ocaml-quickcheck"

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

  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # build
  ./configure --prefix /usr --destdir "$pkgdir"
  make all
}

package () {
  cd "$srcdir/$_gitname-build"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
}
