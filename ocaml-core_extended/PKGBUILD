# Maintainer: Aaron Chen <nextAaron at gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

_pkgname=core_extended
pkgname=ocaml-$_pkgname
pkgver=109.15.00
pkgrel=2
pkgdesc="Extended core library"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ocaml>=3.12' 'ocaml-core>=109.15.00' 'ocaml-custom_printf>=109.15.00' 'ocaml-pcre')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
url="http://janestreet.github.com"
source=("http://ocaml.janestreet.com/ocaml-core/$pkgver/individual/$_pkgname-$pkgver.tar.gz")
md5sums=('1031dd880d78786aab27e86ae7ff15e0')

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
