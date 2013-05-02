# Maintainer: Thibault Suzanne <thi [DOT] suzanne [AT] gmail [DOT] com>

pkgname=ocaml-merlin-git
pkgver=20130220
pkgrel=3
pkgdesc="Context sensitive completion for OCaml in Vim and Emacs"
arch=('any')
url="https://gitorious.org/mlorg"
license=('MIT')
depends=('ocaml>4' 'ocaml-findlib' 'ocaml-yojson' 'ocaml-menhir'
  'ocaml-easy-format' 'ocaml-biniou')
makedepends=('git')

_gitroot="https://github.com/def-lkb/merlin.git"
_gitname="merlin"

build () {
  cd $srcdir

  msg "Connecting to GIT server..."

  if [[ -d "$srcdir/$_gitname" ]]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"

  # configure
  ./configure --prefix "$pkgdir/usr"
  # build
  make
}

package () {
  cd "$srcdir/$_gitname"

  make install
}
