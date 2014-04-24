# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=elm-repl
pkgname=elm-repl
pkgver=0.2.2.1
pkgrel=1
pkgdesc="a REPL for Elm"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-elm>=0.12' 'haskell-bytestring'
  'haskell-bytestring-trie' 'haskell-containers' 'haskell-directory'
  'haskell-filepath' 'haskell-haskeline' 'haskell-mtl>=2' 'haskell-parsec'
  'haskell-process' 'haskell-transformers>=0.2')
depends=('gmp' 'nodejs')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('2f7a8a578d135b43e908abc6dda160fc')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
