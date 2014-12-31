# custom variables
_hkgname=clientsession
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-clientsession
pkgver=0.9.1.1
pkgrel=4
pkgdesc="Securely store session data in a client-side cookie."
url="http://github.com/yesodweb/clientsession/tree/master"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-base64-bytestring=1.0.0.1-57"
         "haskell-cereal=0.4.1.0-2"
         "haskell-cipher-aes=0.2.9-3"
         "haskell-cprng-aes=0.6.1-3"
         "haskell-crypto-api=0.13.2-5"
         "haskell-crypto-random=0.0.8-5"
         "haskell-entropy=0.3.4.1-2"
         "haskell-setenv=0.1.1.1-3"
         "haskell-skein=1.0.9.2-2"
         "haskell-tagged=0.7.3-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("c9563c0bcda1a02cfea2fd39aecec5b9f419901587287f05afdec1e683210022")

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
            -f-test
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
