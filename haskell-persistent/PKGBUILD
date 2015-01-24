# custom variables
_hkgname=persistent
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-persistent
pkgver=2.1.1.4
pkgrel=1
pkgdesc="Type-safe, multi-backend data serialization."
url="http://www.yesodweb.com/book/persistent"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-9"
         "haskell-attoparsec=0.12.1.2-4"
         "haskell-base64-bytestring=1.0.0.1-57"
         "haskell-blaze-html=0.7.0.3-5"
         "haskell-blaze-markup=0.6.2.0-2"
         "haskell-conduit=1.2.3.1-4"
         "haskell-exceptions=0.6.1-4"
         "haskell-fast-logger=2.2.3-4"
         "haskell-lifted-base=0.2.3.3-4"
         "haskell-monad-control=1.0.0.1-2"
         "haskell-monad-logger=0.3.11.1-5"
         "haskell-mtl=2.1.3.1-5"
         "haskell-path-pieces=0.1.5-4"
         "haskell-resource-pool=0.2.3.2-4"
         "haskell-resourcet=1.1.3.3-4"
         "haskell-scientific=0.3.3.5-1"
         "haskell-silently=1.2.4.1-57"
         "haskell-tagged=0.7.3-2"
         "haskell-text=1.2.0.4-1"
         "haskell-transformers-base=0.4.3-4"
         "haskell-unordered-containers=0.2.5.1-6"
         "haskell-vector=0.10.12.2-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("a22573fdb21abd2a91fc2bf0e097c6d962d21e65d548078a632422017bf6765a")

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
        --libsubdir=\$compiler/site-local/\$pkgid \
            -f-nooverlap
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
