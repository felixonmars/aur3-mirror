# custom variables
_hkgname=xournal-parser
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-xournal-parser
pkgver=0.5.0.3
pkgrel=3
pkgdesc="Xournal file parser"
url="http://ianwookim.org/hoodle"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-attoparsec=0.12.1.2-4"
         "haskell-attoparsec-conduit=1.1.0-4"
         "haskell-conduit=1.2.3.1-4"
         "haskell-conduit-extra=1.1.6.2-1"
         "haskell-exceptions=0.6.1-4"
         "haskell-lens=4.7-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-strict=0.3.2-57"
         "haskell-text=1.2.0.4-1"
         "haskell-xml-conduit=1.2.3.1-5"
         "haskell-xml-types=0.3.4-65"
         "haskell-xournal-types=0.5.0.2-3"
         "haskell-zlib-conduit=1.1.0-3")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("9e2272624032b2699b943564c62e2deb8dc59a19f2e2e25cd0b53fc1cfee29e5")

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
