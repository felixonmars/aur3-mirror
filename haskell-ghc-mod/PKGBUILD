# custom variables
_hkgname=ghc-mod
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-ghc-mod
pkgver=5.2.1.2
pkgrel=1
pkgdesc="Happy Haskell Programming"
url="http://www.mew.org/~kazu/proj/ghc-mod/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-async=2.0.2-1"
         "haskell-data-default=0.5.3-59"
         "haskell-djinn-ghc=0.0.2.3-1"
         "haskell-ghc-paths=0.1.0.9-57"
         "haskell-ghc-syb-utils=0.2.2-3"
         "haskell-haskell-src-exts=1.16.0.1-4"
         "haskell-hlint=1.9.16-1"
         "haskell-io-choice=0.0.5-67"
         "haskell-monad-control=1.0.0.1-2"
         "haskell-monad-journal=0.7-1"
         "haskell-mtl=2.1.3.1-5"
         "haskell-split=0.2.2-58"
         "haskell-syb=0.4.4-1"
         "haskell-temporary=1.2.0.3-4"
         "haskell-text=1.2.0.4-1"
         "haskell-transformers-base=0.4.3-4")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz"
        "source.patch")
install="${pkgname}.install"
sha256sums=("3b66b4ab4271ee1a61ab348951d49c38e500535789b469783281d36556cb9687"
            "88585ba27b18f9187096ce2cb3de1b37c366826cf20f732777def5e239e39c33")

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${_hkgname}-${pkgver}"
    
    # no cabal patch
    patch -p4 < "${srcdir}/source.patch"
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
