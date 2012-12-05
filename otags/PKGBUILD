# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Wei Hu <weihu@cs.virginia.edu>

pkgname=otags
pkgver=4.00.1
pkgrel=1
pkgdesc="Emacs and vi Tag Generation for OCaml"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://askra.de/software/otags/"
depends=('ocaml' 'ocaml-sexplib' 'ocaml-type-conv')
options=(!strip !makeflags)
source=("http://askra.de/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('97b6b99288b7182a0218688865374c23')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix /usr
  make || return 1
  make DESTDIR=$pkgdir install
}
