# custom variables
_hkgname=xml-conduit
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-xml-conduit
pkgver=1.2.3.1
pkgrel=4
pkgdesc="Pure-Haskell utilities for dealing with XML with the conduit package."
url="http://github.com/snoyberg/xml"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-attoparsec=0.12.1.2-3"
         "haskell-blaze-builder=0.3.3.4-3"
         "haskell-blaze-html=0.7.0.3-4"
         "haskell-blaze-markup=0.6.2.0-1"
         "haskell-conduit=1.2.3.1-3"
         "haskell-conduit-extra=1.1.6-2"
         "haskell-data-default=0.5.3-59"
         "haskell-monad-control=1.0.0.1-1"
         "haskell-resourcet=1.1.3.3-3"
         "haskell-system-filepath=0.4.13-3"
         "haskell-text=1.2.0.3-1"
         "haskell-xml-types=0.3.4-64")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("282a4251074a4045f78d914a8dfbcdcd9ccaf7fc5741c0e441fd17c42e869881")

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
