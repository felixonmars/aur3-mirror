# custom variables
_hkgname=cabal-sort
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=cabal-sort
pkgver=0.0.2.1
pkgrel=18
pkgdesc="Topologically sort cabal packages"
url="http://hackage.haskell.org/package/${_hkgname}"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-cabal=1.10.1.0"
             "haskell-bytestring=0.9.1.10"
             "haskell-containers=0.4.0.0"
             "haskell-directory=1.1.0.0"
             "haskell-explicit-exception=0.1.6"
             "haskell-fgl=5.4.2.3"
             "haskell-filepath=1.2.0.0"
             "haskell-process=1.0.1.5"
             "haskell-transformers=0.2.2.0")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("c91f363bda014315e708eb0325da41ebbd138c6ad02a3ef509849823432d27f4")

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
