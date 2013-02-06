# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Kostas Andreadis <kmandreadis@gmail.com>

pkgname=lacaml
pkgver=7.0.7
pkgrel=1
pkgdesc="Linear Algebra for OCaml"
arch=('i686' 'x86_64')
url="http://ocaml.info/software.html"
license=('LGPL')
depends=('ocaml' 'lapack' 'blas')
makedepends=('ocaml-findlib')
source=("https://bitbucket.org/mmottl/lacaml/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('fa7e73e52dba34e22f3154ee22214cf2')
options=(!strip)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make install
  install -Dm 644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
