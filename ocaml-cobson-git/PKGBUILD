# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-cobson-git
pkgver=20120727
pkgrel=1
pkgdesc="BSON parser and encoder for OCaml"
url="https://github.com/little-arhat/cobson"
arch=('i686' 'x86_64')
license=('MIT')
depends=("ocaml" "ocaml-findlib" "ocaml-calendar")
makedepends=("git" "ocaml-quickcheck-git")
conflicts=("ocaml-cobson")
provides=("ocaml-cobson")

_gitroot="https://github.com/little-arhat/cobson.git"
_gitname="cobson"

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

  rm -rf "$srcdir/$_gitname-build"
  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure --prefix /usr --destdir "$pkgdir"
  make all
}

package () {
  cd "$srcdir/$_gitname-build"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
}
