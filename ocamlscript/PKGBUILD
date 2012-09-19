# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Dwight Schauer <dschauer@gmail.com>

pkgname=ocamlscript
pkgver=2.0.3
pkgrel=1
pkgdesc="compiles scripts, i.e. one-file programs, into natively-compiled binaries, and executes them."
arch=(i686 x86_64)
url="http://mjambon.com/ocamlscript.html"
license=('custom:boost')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=(http://mjambon.com/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('724a5708fbd7ae09fdfeda48207cc9c5')
options=(!strip !makeflags)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Note(Sergei): we only install `native` versions of the library and
  # `ocamlscript` binary.
  make common optexe || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  export PREFIX=$pkgdir/usr
  mkdir -p $OCAMLFIND_DESTDIR
  mkdir -p $PREFIX/bin

  make install
}
