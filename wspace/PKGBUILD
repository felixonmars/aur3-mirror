# Maintainer: Omar Sandoval <osandov at cs dot washington dot edu>
pkgname=wspace
pkgver=0.3
pkgrel=1
pkgdesc="Interpreter for the Whitespace esoteric programming language."
arch=('i686' 'x86_64')
url='http://compsoc.dur.ac.uk/whitespace/'
license=('GPL')
makedepends=('ghc')
depends=('gmp')
source=("http://compsoc.dur.ac.uk/whitespace/downloads/$pkgname-$pkgver.tgz"
        'wspace_ghc7.diff')
md5sums=('fda72d6e3e5a0e5af2f0a42829f031e5'
         'b95e1f5d6b6b371ad000a752a3d8e7a8')

build() {
  cd WSpace

  patch -s -p1 < ../wspace_ghc7.diff
  ghc --make -o wspace main.hs
}

package() {
  cd WSpace

  mkdir -p $pkgdir/usr/bin
  install -m 755 -T wspace $pkgdir/usr/bin/wspace
}
