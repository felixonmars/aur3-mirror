# $Id: PKGBUILD 67081 2012-03-03 16:12:10Z tdziedzic $
# Maintainer: Eric Swanson <eswanson@alloscomp.com>

pkgname=magic8ball
pkgver=1.0
pkgrel=1
pkgdesc="A console magic eight ball program in written Haskell"
arch=('i686' 'x86_64')
url="https://github.com/lachesis/8ball"
license=('BSD' 'MIT')
makedepends=('ghc' 'sh' 'cabal-install')
source=(https://raw.github.com/lachesis/8ball/319ed52e075dd2c8233c0c9f4b72675625e9440d/8ball.hs)
md5sums=('bfd5dbd7d0db5096ad5353e98cbf2c3f')
         
build() {
  cd $srcdir

  cabal update
  cabal install random

  ghc 8ball.hs
}

package() {
  cd $srcdir
  install -D 8ball $pkgdir/usr/bin/magic8ball
}
