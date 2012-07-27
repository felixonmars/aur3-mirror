# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-extunix-git
pkgver=20120727
pkgrel=2
pkgdesc="Thin bindings to various low-level system APIs which are not covered by Unix module"
arch=('i686' 'x86_64')
url=("http://extunix.forge.ocamlcore.org")
# LGPL + linking exception
license=('LGPL')
depends=('ocaml' 'ocaml-findlib')
makedepends=('ocaml' 'ocaml-ounit')
provides=('ocaml-extunix')
conflicts=('ocaml-extunix')
options=(!makeflags !strip)

_gitroot="http://git.ocamlcore.org/extunix/extunix.git"
_gitname="extunix"

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

  ./configure --disable-debug --docdir "$pkgdir/usr/share/doc/ocaml-extunix" || return 1
 make all doc || return 1
}

package () {
  destdir="${pkgdir}$(ocamlfind printconf destdir)"

  cd "$srcdir/$_gitname-build"

  mkdir -p "${destdir}/stublibs"
  OCAMLFIND_DESTDIR="${destdir}" make install || return 1
}
