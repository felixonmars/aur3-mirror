# custom variables
_hkgname=hakyll
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-hakyll
pkgver=4.6.4.0
pkgrel=1
pkgdesc="A static website compiler library"
url="http://jaspervdj.be/hakyll"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-blaze-html=0.7.0.3-5"
         "haskell-blaze-markup=0.6.2.0-2"
         "haskell-cmdargs=0.10.12-3"
         "haskell-cryptohash=0.11.6-3"
         "haskell-data-default=0.5.3-59"
         "haskell-http-conduit=2.1.5-10"
         "haskell-http-types=0.8.5-11"
         "haskell-lrucache=1.1.1.4-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-network=2.6.0.2-2"
         "haskell-network-uri=2.6.0.1-5"
         "haskell-pandoc=1.13.2-3"
         "haskell-pandoc-citeproc=0.6-17"
         "haskell-parsec=3.1.8-1"
         "haskell-random=1.1-1"
         "haskell-regex-base=0.93.2-58"
         "haskell-regex-tdfa=1.2.0-66"
         "haskell-tagsoup=0.13.3-4"
         "haskell-text=1.2.0.4-1")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("b2242f8264a7449b7bea2b6e6bed9758dd0612a78f15c1b65268ec8c139d414a")

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
            -fcheckexternal -f-watchserver -f-previewserver
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
