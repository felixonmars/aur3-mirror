# custom variables
_hkgname=Agda-executable
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=agda-executable
pkgver=2.3.0.1
pkgrel=1
pkgdesc="Command-line program for type-checking and compiling Agda programs"
url="http://wiki.portal.chalmers.se/agda/"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=("ghc"
             "haskell-agda")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('614594c414c828c87abb1913741db66447c09617d57b92e58ffe445ceffed694')

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
