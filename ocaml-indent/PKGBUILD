# Maintainer: Rémy Grünblatt <grunblattr@gmail.com>

pkgname="ocaml-indent"
pkgdesc="OCaml source code indenter - Mercurial"
pkgrel=1
pkgver=131
url="https://bitbucket.org/camlspotter/ocaml-indent/wiki/Home"
license=("custom")
arch=("i686" "x86_64")
depends=("glibc")
makedepends=("ocaml" "ocaml-type-conv" "ocaml-sexplib" "mercurial" "opam")
provides=("ocaml-indent")
conflicts=("wmii")

_hgroot="http://bitbucket.org/camlspotter/"
_hgrepo="ocaml-indent"

build() {
cd ${srcdir}/ocaml-indent/;
install -D -m644 License.txt "${pkgdir}/usr/share/licenses/ocaml-indent/LICENSE";
echo "no"|omake --install;
export PREFIX=${pkgdir}/usr;
omake ocaml-indent;
install -D -m755 ocaml-indent.opt "${pkgdir}/usr/bin/ocaml-indent";
}
