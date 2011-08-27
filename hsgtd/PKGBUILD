# custom variables
_hkgname=hsgtd
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=hsgtd
pkgver=0.2
pkgrel=18
pkgdesc="Console-based gettings-things-done application"
url="http://www.mlesniak.com/haskell/gettings-things-done-in-haskell/"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-ansi-terminal=0.5.5"
             "haskell-containers=0.4.0.0"
             "haskell-directory=1.1.0.0"
             "haskell-haskeline=0.6.3.2"
             "haskell-mtl=2.0.1.0")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("86616afa153ffaab71a71ff0cd1bdf8b9ecedca2abcd3525f30ddb0f3f295167")

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
