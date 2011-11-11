# custom variables
_hkgname=Agda-executable
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=agda-executable
pkgver=2.2.10
pkgrel=3
pkgdesc="Command-line program for type-checking and compiling Agda programs"
url="http://wiki.portal.chalmers.se/agda/"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-agda=2.2.10-3")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("c65fda739b23d1c996918e8adaf5d8bf7d4a37479e05cd9d56377cb5cb5f544a")

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
