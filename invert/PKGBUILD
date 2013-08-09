# Maintainer: Evan Teitelman <teitelmanevan@gmail.com>

pkgname=invert
pkgver=20130809
pkgrel=1
pkgdesc="Inverts regular expressions"
url="http://www.vidarholen.net/contents/blog/?p=36"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('ghc' 'haskell-parsec')
source=("http://www.vidarholen.net/contents/junk/files/invert.hs")
md5sums=('13200f82df88056b49fcd0be0106c4c6')

prepare() {
  cd "$srcdir"
  sed -i 's/import Maybe/import Data.Maybe/' invert.hs
}

build() {
  cd "$srcdir"
  ghc invert.hs
}

package() {
  cd "$srcdir"
  install -Dm755 invert "$pkgdir/usr/bin/invert"
}
