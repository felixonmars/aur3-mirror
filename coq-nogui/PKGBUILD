pkgname=coq-nogui
pkgver=8.4pl2
pkgrel=4
pkgdesc='Formal proof management system'
arch=('i686' 'x86_64')
url='http://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
depends=('gtk2' 'ocaml')
conflicts=('coq')
provides=('coq')
makedepends=('hevea' 'texlive-latexextra' 'texlive-fontsextra' 'texlive-pictures')
source=("http://coq.inria.fr/distrib/V${pkgver}/files/coq-${pkgver}.tar.gz"
        "ocaml-400.patch")

build() {
  cd "coq-$pkgver"

  patch -uNp1 -i $srcdir/ocaml-400.patch

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -configdir '/etc/xdg/coq/' \
    -opt \
    -with-doc yes \
    -usecamlp4 \
    -coqide no

  # The Makefile doesn't seem to support building in parallel (weird failures)
  make -j1 doc
  make -j1
}

package() {
  cd "coq-$pkgver"

  make COQINSTALLPREFIX="$pkgdir" install
  make COQINSTALLPREFIX="$pkgdir" install-doc
}

md5sums=('7fd98da8db35a89b9718333a31af6153'
         '6330f77670a7810857a77c4b1b9ee4df')
