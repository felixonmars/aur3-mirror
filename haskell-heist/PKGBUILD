# custom variables
_hkgname=heist
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-heist
pkgver=0.14.0.1
pkgrel=3
pkgdesc="An Haskell template system supporting both HTML5 and XML."
url="http://snapframework.com/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-monadcatchio-transformers=0.3.1.0-58"
         "haskell-aeson=0.8.0.2-9"
         "haskell-attoparsec=0.12.1.2-4"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-blaze-html=0.7.0.3-5"
         "haskell-directory-tree=0.12.0-1"
         "haskell-dlist=0.7.1-3"
         "haskell-errors=1.4.7-4"
         "haskell-hashable=1.2.3.1-2"
         "haskell-map-syntax=0.2-1"
         "haskell-mtl=2.1.3.1-5"
         "haskell-random=1.1-1"
         "haskell-text=1.2.0.4-1"
         "haskell-unordered-containers=0.2.5.1-6"
         "haskell-vector=0.10.12.2-2"
         "haskell-xmlhtml=0.2.3.4-3")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("7ca43497a5d905152aa39b07b99d9c9b50d91538f5cd416bf565ec926cd313da")

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
