# Contributor: Arch Haskell Team <arch-haskell@haskell.org>
# Contributor: Lex Black <autumn-wind at web dot de>

_hkgname=SourceGraph
pkgname=sourcegraph
pkgver=0.7.0.2
pkgrel=1
pkgdesc="Static code analysis using graph-theoretic techniques."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-cabal' 'haskell-graphalyze' 'haskell-containers' 'haskell-directory' 'haskell-fgl' 'haskell-filepath' 'haskell-graphviz' 'haskell-haskell-src-exts' 'haskell-mtl' 'haskell-multiset' 'haskell-random')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('5c6f97f01f7bcaacd6190cf3181d9160')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
