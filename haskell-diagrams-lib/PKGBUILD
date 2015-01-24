# custom variables
_hkgname=diagrams-lib
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-diagrams-lib
pkgver=1.2.0.8
pkgrel=1
pkgdesc="Embedded domain-specific language for declarative graphics"
url="http://projects.haskell.org/diagrams"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-juicypixels=3.2.2-1"
         "haskell-memotrie=0.6.2-4"
         "haskell-active=0.1.0.17-5"
         "haskell-colour=2.3.3-57"
         "haskell-data-default-class=0.0.1-57"
         "haskell-diagrams-core=1.2.0.5-1"
         "haskell-dual-tree=0.2.0.5-4"
         "haskell-fingertree=0.1.0.0-2"
         "haskell-hashable=1.2.3.1-2"
         "haskell-intervals=0.7.0.1-2"
         "haskell-lens=4.7-2"
         "haskell-monoid-extras=0.3.3.5-4"
         "haskell-optparse-applicative=0.11.0.1-3"
         "haskell-semigroups=0.16.0.1-4"
         "haskell-tagged=0.7.3-2"
         "haskell-vector-space=0.9-2"
         "haskell-vector-space-points=0.2.1-1")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("0e7d1de4610d0bba49b70a7a655b616218648a30432981117ec60927380f3fbd")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    # no cabal patch
    # no source patch
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --enable-library-profiling --enable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock --hoogle --html
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/${pkgname}/register.sh"
    install    -m744 unregister.sh "${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh"
    install -d -m755 "${pkgdir}/usr/share/doc/ghc/html/libraries"
    ln -s "/usr/share/doc/${pkgname}/html" "${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}"
    runhaskell Setup copy --destdir="${pkgdir}"
    install -D -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}"
}
