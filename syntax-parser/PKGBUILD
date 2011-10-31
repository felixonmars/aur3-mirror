# Maintainer:  <ying@althonx4>
pkgname=syntax-parser
_pkgname=syntax
pkgver=6.0b7
pkgrel=1 
pkgdesc="SYNTAX allows to generate parsers based on their grammatical descriptions. Recognized formalisms: CFG (deterministic or ambiguous), TAG, LFG, RCG, ..."
url="http://syntax.gforge.inria.fr/"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(https://gforge.inria.fr/frs/download.php/25190/${_pkgname}-$pkgver.tar.gz)
md5sums=('882d52ee167d3ac57c5b1c2141d00934')
build() {
  cd $startdir/src/${_pkgname}-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
