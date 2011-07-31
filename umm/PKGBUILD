# custom variables
_hkgname=UMM
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=umm
pkgver=0.3.1
pkgrel=18
pkgdesc="A small command-line accounting tool"
url="http://www.korgwal.com/umm/"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-haskell98=1.1.0.1"
             "haskell-old-time=1.0.0.6"
             "haskell-parsec=3.1.1"
             "haskell-process=1.0.1.5"
             "haskell-utf8-string=0.3.6")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("b0e0697180aaa359a733dd6eba62a1f313491480ff57cf5cf366dacf26dd334d")

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
