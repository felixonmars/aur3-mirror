# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=elm-server
pkgname=elm-server
pkgver=0.11
pkgrel=1
pkgdesc="The Elm language server."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-elm>=0.11' 'haskell-containers>=0.3' 'haskell-directory'
  'haskell-filepath' 'haskell-mtl' 'haskell-process' 'haskell-snap-core'
  'haskell-snap-server' 'haskell-unordered-containers')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('fed6a6f2ac174a8817ce9c757c429b9b')
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
