# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from darcs sources.

# Contributor: Sergey Plaksin <serp256 at gmail dot com>
pkgname=ocaml-lwt-darcs
pkgver=20101208
pkgrel=1
pkgdesc="A library for cooperative threads in OCaml"
arch=(i686 x86_64)
url="http://ocsigen.org/lwt/"
license=('LGPL')
depends=(libev 'ocaml>=3.11.0' ocaml-findlib react)
makedepends=('darcs')
provides=(ocaml-lwt)
conflicts=(ocaml-lwt lwt)
#source=($pkgname-$pkgver.tar.gz)
md5sums=() #generate with 'makepkg -g'

_darcstrunk="http://ocsigen.org/darcs"
_darcsmod="lwt"

build() {
  cd "$srcdir"

  msg "Checking for previous build"

  if [[ -d $_darcsmod/_darcs ]]
  then
    msg "Retrieving missing patches"
    cd $_darcsmod
    darcs pull -a $_darcstrunk/$_darcsmod
  else
    msg "Retrieving complete sources"
    darcs get --partial --set-scripts-executable $_darcstrunk/$_darcsmod
    cd $_darcsmod
  fi

  rm -rf "$srcdir/$_darcsmod-build"
  cp -r "$srcdir/$_darcsmod" "$srcdir/$_darcsmod-build"
  cd "$srcdir/$_darcsmod-build"

  msg "Starting build"
  #
  # BUILD
  #
	ocaml setup.ml -configure --prefix /usr
	ocaml setup.ml -build
	mkdir -p "$startdir/pkg/$(ocamlfind printconf destdir)/stublibs"
	OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)" ocaml setup.ml -install


}
