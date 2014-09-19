pkgname=ocaml-camlp4
pkgver=4.02.0
pkgrel=1

pkgdesc='A system for writing extensible parsers for programming languages.'
url='https://github.com/ocaml/camlp4'
arch=('i686' 'x86_64')
license=('GPL')

depends=('ocaml')
makedepends=('ocaml')

source=("https://github.com/ocaml/camlp4/archive/$pkgver+1.tar.gz")

md5sums=('SKIP')

build() {
    cd camlp4-"$pkgver"-1
    ./configure
    make
}

package() {
    cd camlp4-"$pkgver"-1
    make BINDIR="$pkgdir"/usr/bin LIBDIR="$pkgdir"/usr/lib install
}
