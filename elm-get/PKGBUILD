# Maintainer: Colin Woodbury
_hkgname=elm-get
pkgname=elm-get
pkgver=0.1.1.1
pkgrel=1
pkgdesc="Tool for sharing and using Elm libraries"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-elm>=0.10.1' 'haskell-http' 'haskell-aeson'
  'haskell-binary' 'haskell-bytestring' 'haskell-containers' 'haskell-directory'
  'haskell-filepath' 'haskell-http-client'
  'haskell-http-types' 'haskell-json' 'haskell-mtl' 'haskell-network'
  'haskell-optparse-applicative' 'haskell-pretty' 'haskell-process'
  'haskell-resourcet' 'haskell-text' 'haskell-vector')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('566b8e11fc30a7da4ca7b863ffae2522')
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
