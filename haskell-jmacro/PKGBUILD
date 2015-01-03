# custom variables
_hkgname=jmacro
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-jmacro
pkgver=0.6.9
pkgrel=14
pkgdesc="QuasiQuotation library for programmatic generation of Javascript code."
url="http://hackage.haskell.org/package/${_hkgname}"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-8"
         "haskell-haskell-src-exts=1.16.0.1-3"
         "haskell-haskell-src-meta=0.6.0.8-7"
         "haskell-mtl=2.1.3.1-5"
         "haskell-parseargs=0.1.5.2-5"
         "haskell-parsec=3.1.7-3"
         "haskell-regex-posix=0.95.2-58"
         "haskell-safe=0.3.8-2"
         "haskell-syb=0.4.2-3"
         "haskell-text=1.2.0.3-1"
         "haskell-unordered-containers=0.2.5.1-5"
         "haskell-vector=0.10.12.2-2"
         "haskell-wl-pprint-text=1.1.0.3-1")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("e66afca2badd082b402ad827544c6c2fd046ac8c2b97f3993edce719a9a337df")

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
            -f-benchmarks
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
