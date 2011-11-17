# custom variables
_hkgname=cblrepo
_licensefile=LICENSE-2.0

# PKGBUILD options/directives
pkgname=cblrepo
pkgver=0.3.1
pkgrel=4
pkgdesc="Tool to maintain a database of CABAL packages and their dependencies"
url="http://hackage.haskell.org/package/${_hkgname}"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-unixutils=1.46-3"
             "haskell-ansi-wl-pprint=0.6.3-18"
             "haskell-cmdargs=0.7-18"
             "haskell-json=0.4.4-18"
             "haskell-mtl=2.0.1.0-3.1"
             "haskell-tar=0.3.1.0-5"
             "haskell-unix=2.4.2.0-2"
             "haskell-zlib=0.5.3.1-2.1")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("4790906544d83a1e11d1344a196eeff77532d6246e5e5112446a330387003bf0")

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
