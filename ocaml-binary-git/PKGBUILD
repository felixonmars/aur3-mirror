# Maintainer: Sergei Lebedev <superbobry@gmail.com>
pkgname=ocaml-binary-git
pkgver=20110810
pkgrel=1
pkgdesc="Binary serialization of OCaml numeric types to and from strings."
arch=('i686' 'x86_64')
url="https://github.com/superbobry/ocaml-binary"
license='LGPL'
depends=('ocaml' 'ocaml-findlib')
makedepends=('git')
provides=('ocaml-binary')
conflicts=('ocaml-binary')

_gitroot="https://github.com/superbobry/ocaml-binary.git"
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

  ocaml setup.ml -configure --prefix /usr --destdir ${pkgdir} --disable-tests
  ocaml setup.ml -build
}

package () {
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

  cd "$srcdir/$_gitname-build"

  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" ocaml setup.ml -install || return 1
}
