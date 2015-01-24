# custom variables
_hkgname=pandoc-citeproc
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-pandoc-citeproc
pkgver=0.6
pkgrel=17
pkgdesc="Supports using pandoc with citeproc"
url="http://hackage.haskell.org/package/${_hkgname}"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-9"
         "haskell-aeson-pretty=0.7.2-7"
         "haskell-attoparsec=0.12.1.2-4"
         "haskell-data-default=0.5.3-59"
         "haskell-hs-bibutils=5.5-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-pandoc=1.13.2-3"
         "haskell-pandoc-types=1.12.4.1-17"
         "haskell-parsec=3.1.8-1"
         "haskell-rfc5051=0.1.0.3-3"
         "haskell-split=0.2.2-58"
         "haskell-syb=0.4.4-1"
         "haskell-tagsoup=0.13.3-4"
         "haskell-temporary=1.2.0.3-4"
         "haskell-text=1.2.0.4-1"
         "haskell-vector=0.10.12.2-2"
         "haskell-xml-conduit=1.2.3.1-5"
         "haskell-yaml=0.8.10.1-8")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("ab60459ead81420d1320314b194a40f6d91bd89b34c88547e6283ab8724511f2")

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
            -f-test_citeproc -f-unicode_collation -f-embed_data_files -fbibutils -fsmall_base
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
