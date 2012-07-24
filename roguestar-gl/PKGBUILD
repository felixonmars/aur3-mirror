# Maintainer: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=roguestar-gl
pkgname=roguestar-gl
pkgver=0.6.0.1
pkgrel=1
pkgdesc="Sci-fi roguelike (turn-based, chessboard-tiled, role playing) game"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:OtherLicense')
arch=('i686' 'x86_64')
makedepends=('ghc'
             'haskell-arrows'
             'haskell-bytestring'
             'haskell-containers'
             'haskell-filepath'
             'haskell-glut'
             'haskell-monadrandom'
             'haskell-mtl'
             'haskell-opengl'
             'haskell-priority-sync'
             'haskell-random'
             'haskell-rsagl'
             'haskell-rsagl-frp'
             'haskell-rsagl-math'
             'haskell-stm=2.1.2.1')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('246dc18baab3ea4ced99c4a8941954e8')

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
