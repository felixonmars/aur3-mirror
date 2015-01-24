# custom variables
_hkgname=scotty
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-scotty
pkgver=0.9.1
pkgrel=2
pkgdesc="Haskell web framework inspired by Ruby's Sinatra, using WAI and Warp"
url="https://github.com/scotty-web/scotty"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-9"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-case-insensitive=1.2.0.3-4"
         "haskell-data-default=0.5.3-59"
         "haskell-http-types=0.8.5-11"
         "haskell-monad-control=1.0.0.1-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-regex-compat=0.95.1-58"
         "haskell-text=1.2.0.4-1"
         "haskell-transformers-base=0.4.3-4"
         "haskell-wai=3.0.2.1-2"
         "haskell-wai-extra=3.0.4.1-1"
         "haskell-warp=3.0.5.1-1")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("15eb1c05817ea89a59d934835b91f8c3f7872ca7e45c44975b11d1d32c7c0770")

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
