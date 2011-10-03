# Maintainer: Sergei Lebedev <superbobry@gmail.com>
pkgname=ocaml-oasis-darcs
pkgver=20111003
pkgrel=2
pkgdesc='Architecture for building OCaml libraries and applications.'
arch=('any')
url='http://oasis.forge.ocamlcore.org/'
license=('LGPL')
depends=('glibc')
makedepends=('ocaml'
  'ocaml-extlib'
  'ocaml-fileutils>=0.4.2'
  'ocaml-findlib'
  'ocaml-ocamlgraph'
  'ocaml-ocamlify'
  'ocaml-odn>=0.0.3'
  'ocaml-ounit'
  'ocaml-pcre'
  'ocaml-expect'
  'ocaml-ocamlmod')
provides=('ocaml-oasis')
conflicts=('ocaml-oasis')
options=(!strip)

_darcstrunk="http://darcs.ocamlcore.org/repos"
_darcsmod="oasis"

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

	# BUILD
    ocaml setup.ml -configure --prefix /usr --destdir ${pkgdir}
    ocaml setup.ml -build
}

package() {
	cd "$srcdir/$_darcsmod-build"

    OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}"
    OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" ocaml setup.ml -install || return 1
}
