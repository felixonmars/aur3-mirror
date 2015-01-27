# custom variables
_hkgname=purescript
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-purescript
pkgver=0.6.4
pkgrel=1
pkgdesc="PureScript Programming Language Compiler"
url="http://www.purescript.org/"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-file-embed=0.0.7.1-1"
         "haskell-monad-unify=0.2.2-3"
         "haskell-mtl=2.1.3.1-5"
         "haskell-optparse-applicative=0.11.0.1-3"
         "haskell-parsec=3.1.8-1"
         "haskell-pattern-arrows=0.0.2-1"
         "haskell-unordered-containers=0.2.5.1-6"
         "haskell-utf8-string=0.3.8-3")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "cabal.patch")
install="${pkgname}.install"
sha256sums=("54871e9a3d7d34e3de0c79c5ef618c7125385d6c572bcbe078730ba508babdae"
            "1aaf85aa79d22eba266a9ec92264268277a38bcdcfa87036d35dbb0ae703675a")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    patch purescript.cabal "${srcdir}/cabal.patch" 
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
