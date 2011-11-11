# custom variables
_hkgname=nptools
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=nptools
pkgver=0.5.0
pkgrel=6
pkgdesc="A collection of random tools"
url="http://hackage.haskell.org/package/${_hkgname}"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-hsh=2.0.3-20"
             "haskell-missingh=1.1.1.0-2"
             "haskell-sha=1.5.0.0-2"
             "haskell-ansi-terminal=0.5.5-18"
             "haskell-colour=2.3.1-18"
             "haskell-split=0.1.4.1-1"
             "haskell-unix=2.4.2.0-2")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("8a8d9775dcaef5acdc728277214a7e0080c3d2b680d7e0405d5f1eb1675d93dd")

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
    runhaskell Setup configure -O --prefix=/usr --docdir=/usr/share/doc/${pkgname}
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
