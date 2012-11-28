# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-core-extended
_pkgname=core_extended
pkgver=108.08.00
pkgrel=1
pkgdesc="Jane Street's extended standard library for OCaml"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ocaml>=3.12'
         'ocaml-pcre'
         'ocaml-core>=0.7.0')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
url="http://bitbucket.org/yminsky/ocaml-core/wiki/Home"
source=("http://ocaml.janestreet.com/ocaml-core/$pkgver/individual/$_pkgname-$pkgver.tar.gz")
md5sums=('f594553b318ffbd52c27c88328c0ff86')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --enable-docs --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_COMMANDS="ocamldoc=ocamldoc -thread"
  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make install
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
