# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Sylvester Johansson <scj(at)archlinux(dot)us>
# Contributor: Nicolas Pouillard <nicolas(dot)pouillard(at)gmail(dot)com>

pkgname=ocaml-bin-prot
_pkgname=bin_prot
pkgver=108.08.00
pkgrel=1
pkgdesc="binary protocol generator for OCaml"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ocaml' 'ocaml-type-conv>=3.0.4')
makedepends=('ocaml-findlib')
url="http://bitbucket.org/yminsky/ocaml-core/wiki/Home"
source=("http://ocaml.janestreet.com/ocaml-core/$pkgver/individual/$_pkgname-$pkgver.tar.gz")
md5sums=('ccf26dab7ab6b1f8762c374b1b6430d1')
options=(!strip !makeflags)

build () {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package () {
  cd "$srcdir/$_pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make install
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
