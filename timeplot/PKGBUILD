# custom variables
_hkgname=timeplot
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=timeplot
pkgver=0.3.10
pkgrel=2
pkgdesc="A tool for visualizing time series from log files."
url="http://haskell.org/haskellwiki/Timeplot"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-chart=0.14-23"
             "haskell-bytestring-lexing=0.2.1-19"
             "haskell-cairo=0.12.1-2"
             "haskell-colour=2.3.1-18"
             "haskell-data-accessor=0.2.2-18"
             "haskell-data-accessor-template=0.2.1.8-1"
             "haskell-regex-tdfa=1.1.8-18"
             "haskell-strptime=1.0.2-1"
             "haskell-transformers=0.2.2.0-3.1")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("2e75e3911752cf6d496a8fc673dea7b0b835eb8fc360b3104e7272479a597cbc")

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
