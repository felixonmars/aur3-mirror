# Maintainer: Sergei Lebedev <superbobry@gmail.com>
pkgname=ocaml-erlang-port-git
pkgver=20110823
pkgrel=1
pkgdesc="Erlang port interface for OCaml"
arch=('i686' 'x86_64')
url="https://github.com/EchoTeam/ocaml-erlang-port"
license='FreeBSD'
depends=('ocaml' 'ocaml-findlib')
makedepends=('git')
provides=('ocaml-erlang-port')
conflicts=('ocaml-erlang-port')

_gitroot="https://github.com/EchoTeam/ocaml-erlang-port.git"
_gitname=${pkgname/-git/}


build () {
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

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

  make
}

package () {
  cd "$srcdir/$_gitname-build"

  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p $OCAMLFIND_DESTDIR
  OCAMLFIND_DESTDIR=$OCAMLFIND_DESTDIR make install-package || return 1
}
