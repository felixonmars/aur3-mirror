# custom variables
_hkgname=grapefruit-frp
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-grapefruit-frp
pkgver=0.1.0.5
pkgrel=1
pkgdesc="Functional Reactive Programming core"
url="http://grapefruit-project.org/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-typecompose=0.9.10-1"
         "haskell-arrows=0.4.4.1-1"
         "haskell-fingertree=0.1.0.0-2"
         "haskell-semigroups=0.16.0.1-4")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "cabal.patch")
install="${pkgname}.install"
sha256sums=("15b626d8eaa352f3ad891cf7a235a71161791797326400d630a4fe4a9dacb094"
            "f1bdcc387b141f21708121d9be310b94491b5bfa4e8fb5cd5cc4df6f358e628e")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    patch grapefruit-frp.cabal "${srcdir}/cabal.patch" 
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
