# custom variables
_hkgname=shakespeare
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-shakespeare
pkgver=2.0.2.1
pkgrel=6
pkgdesc="A toolkit for making compile-time interpolated templates"
url="http://www.yesodweb.com/book/shakespearean-templates"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-8"
         "haskell-blaze-html=0.7.0.3-4"
         "haskell-blaze-markup=0.6.2.0-1"
         "haskell-exceptions=0.6.1-3"
         "haskell-parsec=3.1.7-3"
         "haskell-system-fileio=0.3.16-3"
         "haskell-system-filepath=0.4.13-3"
         "haskell-text=1.2.0.3-1")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("ea430c50871296a7a1b37af6023f6c5345a7063ece748701e5e339c626b5e3e8")

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
            -f-test_roy -f-test_coffee -f-test_export
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
