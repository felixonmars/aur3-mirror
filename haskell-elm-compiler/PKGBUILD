# custom variables
_hkgname=elm-compiler
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-elm-compiler
pkgver=0.14.1
pkgrel=1
pkgdesc="Values to help with elm-package, elm-make, and elm-lang.org."
url="http://elm-lang.org"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-9"
         "haskell-aeson-pretty=0.7.2-7"
         "haskell-blaze-html=0.7.0.3-5"
         "haskell-blaze-markup=0.6.2.0-2"
         "haskell-cmdargs=0.10.12-3"
         "haskell-indents=0.3.3-2"
         "haskell-language-ecmascript=0.17-2"
         "haskell-language-glsl=0.1.1-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-parsec=3.1.8-1"
         "haskell-text=1.2.0.4-1"
         "haskell-union-find=0.2-1"
         "haskell-unordered-containers=0.2.5.1-6")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "cabal.patch")
install="${pkgname}.install"
sha256sums=("8ea41928e562b5255ad5f9e772f63a740f3c09fbf97f2b00c745c5776325c057"
            "42188aad5444f8581b78b21fcfee719025e2438cc20f46b8f0274945d9c422b0")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    patch elm-compiler.cabal "${srcdir}/cabal.patch" 
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
