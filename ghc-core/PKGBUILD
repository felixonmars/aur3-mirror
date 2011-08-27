# custom variables
_hkgname=ghc-core
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=ghc-core
pkgver=0.5.4
pkgrel=1
pkgdesc="Display GHC's core and assembly output in a pager"
url="http://code.haskell.org/~dons/code/ghc-core"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-colorize-haskell=1.0.1"
             "haskell-directory=1.1.0.0"
             "haskell-filepath=1.2.0.0"
             "haskell-pcre-light=0.4"
             "haskell-process=1.0.1.5")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("e7d9b43e04fca981a0406dd23cc01ff3a25d32a0e0fd978f4816fc3bbfa8c8e8")

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
