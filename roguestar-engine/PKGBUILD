# Maintainer: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=roguestar-engine
pkgname=roguestar-engine
pkgver=0.6.0.1
pkgrel=1
pkgdesc="Sci-fi roguelike (turn-based, chessboard-tiled, role playing) game"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:OtherLicense')
arch=('i686' 'x86_64')
makedepends=('ghc'
             'haskell-array'
             'haskell-bytestring'
             'haskell-containers'
             'haskell-data-memocombinators'
             'haskell-maybet'
             'haskell-monadrandom'
             'haskell-mtl'
             'haskell-old-time'
             'haskell-parallel'
             'haskell-priority-sync'
             'haskell-psqueue'
             'haskell-random'
             'haskell-stm')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('336ed2d0775d6488de5065a0e2042d58')

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
