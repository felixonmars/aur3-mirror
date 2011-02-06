#Contributor: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=react
pkgver=0.9.0
pkgrel=3
pkgdesc="An OCaml module for functional reactive programming"
arch=('i686' 'x86_64')
url="http://erratique.ch/software/react"
license=('BSD')
depends=('ocaml>=3.11.0' 'ocaml-findlib')
source=(http://erratique.ch/software/$pkgname/releases/$pkgname-$pkgver.tbz react.diff)
md5sums=('193a64a2abb0eebc6a88c19fba18ca85'
         'f12b2c4038808ee2396ec7b33d4161a9')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  patch -Np0 < $srcdir/react.diff

  ./build || return 1
  INSTALLDIR="$pkgdir/usr/lib/ocaml/site-lib/react" ./build install
}
