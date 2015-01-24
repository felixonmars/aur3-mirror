# custom variables
_hkgname=yesod-test
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-yesod-test
pkgver=1.4.2.2
pkgrel=4
pkgdesc="integration testing for WAI/Yesod Applications"
url="http://www.yesodweb.com"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-hunit=1.2.5.2-57"
         "haskell-attoparsec=0.12.1.2-4"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-blaze-html=0.7.0.3-5"
         "haskell-blaze-markup=0.6.2.0-2"
         "haskell-case-insensitive=1.2.0.3-4"
         "haskell-cookie=0.4.1.4-4"
         "haskell-hspec-core=2.1.2-7"
         "haskell-html-conduit=1.1.1.1-3"
         "haskell-http-types=0.8.5-11"
         "haskell-monad-control=1.0.0.1-2"
         "haskell-network=2.6.0.2-2"
         "haskell-persistent=2.1.1.4-1"
         "haskell-text=1.2.0.4-1"
         "haskell-wai=3.0.2.1-2"
         "haskell-wai-extra=3.0.4.1-1"
         "haskell-xml-conduit=1.2.3.1-5"
         "haskell-xml-types=0.3.4-65"
         "haskell-yesod-core=1.4.7.2-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("9b0765481a1958ca1d71d6e1642d20935658f60ed2d123cea89defac8e9859c6")

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
