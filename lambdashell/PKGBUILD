# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=LambdaShell
pkgname=lambdashell
pkgver=0.9.3
pkgrel=1
pkgdesc="Simple shell for evaluating lambda expressions"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-shellac>=0.9' 'haskell-shellac-compatline>=0.9' 'haskell-mtl' 'haskell-parsec' 'haskell-readline')
depends=('gmp' 'readline')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('5a267c2889108c05eb3cb848e1068990')


build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
