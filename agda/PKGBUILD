# custom variables
_hkgname=Agda
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=agda
pkgver=2.4.2.2
pkgrel=1
pkgdesc="A dependently typed functional programming language and proof assistant"
url="http://wiki.portal.chalmers.se/agda/"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-quickcheck=2.7.6-4"
         "haskell-stmonadtrans=0.3.2-1"
         "haskell-boxes=0.1.3-1"
         "haskell-data-hash=0.2.0.0-1"
         "haskell-equivalence=0.2.5-1"
         "haskell-geniplate=0.6.0.5-1"
         "haskell-hashable=1.2.3.0-3"
         "haskell-hashtables=1.2.0.1-3"
         "haskell-haskell-src-exts=1.16.0.1-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-parallel=3.2.0.5-2"
         "haskell-strict=0.3.2-57"
         "haskell-text=1.1.1.3-3"
         "haskell-unordered-containers=0.2.5.1-4"
         "haskell-zlib=0.5.4.2-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "cabal.patch")
install="${pkgname}.install"
sha256sums=("2344107654d0cb2a18dcf179ed3ea0f427839e058771ed628da64fbaed55bbc3"
            "067b0771ed0d0d7c97a0c432e7b832a3c84dfa7e8751db153cdb664c287a5109")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    patch Agda.cabal "${srcdir}/cabal.patch" 
    # no source patch
}

build() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    runhaskell Setup configure -O --disable-library-profiling --disable-shared \
        --prefix=/usr --docdir="/usr/share/doc/${pkgname}" \
        --libsubdir=\$compiler/site-local/\$pkgid \
            -f-epic -fcpphs
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
