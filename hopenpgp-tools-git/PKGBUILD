# Maintainer: Daniel Albers <daniel@lbe.rs>
pkgname=hopenpgp-tools-git
_basename=${pkgname%-git}
pkgver=0.7.2
pkgrel=1
pkgdesc="command-line tools for performing some OpenPGP-related operations"
url="http://hackage.haskell.org/package/${_basename}"
license=('GNU Affero GPL v3')
arch=('i686' 'x86_64')
makedepends=('cabal-install')
depends=('ghc' 'haskell-yaml')
source=(git+https://alioth.debian.org/anonscm/git/users/clint/${_basename}.git)
md5sums=('SKIP')

build() {
    pushd "$srcdir"/${_basename} && cabal install
    popd
}

package() {
 :
}
