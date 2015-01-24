# custom variables
_hkgname=yesod-core
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-yesod-core
pkgver=1.4.7.2
pkgrel=2
pkgdesc="Creation of type-safe, RESTful web applications."
url="http://www.yesodweb.com/"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-9"
         "haskell-auto-update=0.1.2.1-1"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-blaze-html=0.7.0.3-5"
         "haskell-blaze-markup=0.6.2.0-2"
         "haskell-case-insensitive=1.2.0.3-4"
         "haskell-cereal=0.4.1.1-1"
         "haskell-clientsession=0.9.1.1-5"
         "haskell-conduit=1.2.3.1-4"
         "haskell-conduit-extra=1.1.6.2-1"
         "haskell-cookie=0.4.1.4-4"
         "haskell-data-default=0.5.3-59"
         "haskell-exceptions=0.6.1-4"
         "haskell-fast-logger=2.2.3-4"
         "haskell-http-types=0.8.5-11"
         "haskell-lifted-base=0.2.3.3-4"
         "haskell-monad-control=1.0.0.1-2"
         "haskell-monad-logger=0.3.11.1-5"
         "haskell-mtl=2.1.3.1-5"
         "haskell-mwc-random=0.13.3.0-1"
         "haskell-parsec=3.1.8-1"
         "haskell-path-pieces=0.1.5-4"
         "haskell-primitive=0.5.4.0-2"
         "haskell-random=1.1-1"
         "haskell-resourcet=1.1.3.3-4"
         "haskell-safe=0.3.8-2"
         "haskell-shakespeare=2.0.2.2-1"
         "haskell-text=1.2.0.4-1"
         "haskell-transformers-base=0.4.3-4"
         "haskell-unix-compat=0.4.1.4-1"
         "haskell-unordered-containers=0.2.5.1-6"
         "haskell-vector=0.10.12.2-2"
         "haskell-wai=3.0.2.1-2"
         "haskell-wai-extra=3.0.4.1-1"
         "haskell-wai-logger=2.2.3-16"
         "haskell-warp=3.0.5.1-1"
         "haskell-word8=0.1.1-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("de104ae5ce4002c41809d647a9c3ae7fe868c301df67bb19f09fa4a29bd4df4c")

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
