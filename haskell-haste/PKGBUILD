# Maintainer: Alucryd <alucryd at gmail dot com>
# Contributor: Arch Haskell Team <arch-haskell at haskell dot org>

pkgname=haskell-haste
pkgver=0.1.1
pkgrel=1
pkgdesc="A universal pastebin tool, written in Haskell."
arch=('i686' 'x86_64')
url="http://hackage.haskell.org/package/${pkgname#*-}"
license=('custom:BSD3')
depends=('gmp')
makedepends=('ghc' 'haskell-curl' 'haskell-filepath=1.1.0.4' 'haskell-mtl')
source=("http://hackage.haskell.org/packages/archive/${pkgname#*-}/${pkgver}/${pkgname#*-}-${pkgver}.tar.gz")
sha256sums=('d22e0568df4f3cc6182aaec8f1e3150ae73bd11e32076bc9a8d6064a4e34e3ef')

build() {
    cd "${srcdir}"/${pkgname#*-}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}

package() {
    cd "${srcdir}"/${pkgname#*-}-${pkgver}
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    rm -f "${pkgdir}"/usr/share/doc/${pkgname}/LICENSE
}

# vim: ts=2 sw=2 et:
