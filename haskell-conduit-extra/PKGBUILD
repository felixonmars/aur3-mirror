# custom variables
_hkgname=conduit-extra
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-conduit-extra
pkgver=1.1.6.2
pkgrel=1
pkgdesc="Batteries included conduit: adapters for common libraries."
url="http://github.com/snoyberg/conduit"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-attoparsec=0.12.1.2-4"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-conduit=1.2.3.1-4"
         "haskell-monad-control=1.0.0.1-2"
         "haskell-network=2.6.0.2-2"
         "haskell-primitive=0.5.4.0-2"
         "haskell-resourcet=1.1.3.3-4"
         "haskell-stm=2.4.4-2"
         "haskell-streaming-commons=0.1.8.1-1"
         "haskell-text=1.2.0.4-1"
         "haskell-transformers-base=0.4.3-4")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("0c86f624c6546b9cab09622703b92018aaa5f51784a1e4da496d9fd66bbf66ce")

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
