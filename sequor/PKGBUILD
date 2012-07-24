# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=sequor
pkgname=sequor
pkgver=0.2.3
pkgrel=1
pkgdesc="A sequence labeler based on Collins's sequence perceptron."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-array' 'haskell-binary' 'haskell-bytestring' 'haskell-containers' 'haskell-mtl' 'haskell-pretty' 'haskell-text' 'haskell-vector')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('7d343a71321595c96d7a64878009f07c')

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
