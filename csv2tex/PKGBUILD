#Maintainer: Andreas Vinter-Hviid <andreas.vinterhviid@gmail.com>
_hkgname=csv2tex
pkgname=csv2tex
pkgver=1.0
pkgrel=1
pkgdesc="Converts csv to (La)Tex-style tables"
url="https://github.com/ismettern/csv2tex"
license=('MIT')
arch=('x86_64')
makedepends=('ghc' 'haskell-parsec')
depends=()
options=('strip')
source=(https://github.com/downloads/ismettern/csv2tex/${_hkgname}-${pkgver}.tar.gz)
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
md5sums=('558a68cd39ce34f0dfc9e6cda98b479f')
