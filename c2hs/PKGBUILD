# custom variables
_hkgname=c2hs
_licensefile=COPYING

# PKGBUILD options/directives
pkgname=c2hs
pkgver=0.16.5
pkgrel=1
pkgdesc="C->Haskell FFI tool that gives some cross-language type safety"
url="http://www.cse.unsw.edu.au/~chak/haskell/c2hs/"
license=("GPL-2")
arch=('i686' 'x86_64')
makedepends=("ghc"
             "haskell-array"
             "haskell-containers"
             "haskell-directory"
             "haskell-filepath"
             "haskell-language-c"
             "haskell-pretty"
             "haskell-process")
options=('strip')
source=(
  "http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
  "c2hs"
)
md5sums=('4bb2d8e52ade414530366e510f8bf7e4'
         '21616e0891fe8e98c3cd383be64ff2a5')

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --prefix=/usr --docdir=/usr/share/doc/${pkgname}
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
    mv ${pkgdir}/usr/bin/c2hs{,-bin}
    cp ${srcdir}/c2hs ${pkgdir}/usr/bin/c2hs
    chmod +rx ${pkgdir}/usr/bin/c2hs
}
