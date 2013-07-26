# Maintainer: Andrew Swan <wakelin.swan+arch@gmail.com>
pkgname=coq-hott
pkgver=8.4
pkgrel=1
pkgdesc='A fork of the coq proof assistant, adapted for homotopy type theory.'
arch=('i686' 'x86_64')
url='http://github.com/HoTT/coq'
conflicts=('coq')
license=('LGPL2.1')
options=('!emptydirs')
depends=('gtk2' 'ocaml')
makedepends=('lablgtk2' 'ocaml-findlib')
source=("https://github.com/HoTT/coq/archive/stable.zip")
md5sums=('c4da9c363e710f7ba8c41577843f48bd')

build() {
  cd "coq-stable"

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -configdir '/etc/xdg/coq/' \
    -opt \
    -coqide opt \
    -usecamlp4 \
    -with-doc no

  make world
}

package() {
  cd "coq-stable"

  make COQINSTALLPREFIX="$pkgdir" install
}
