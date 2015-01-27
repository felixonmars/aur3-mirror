# custom variables
_hkgname=haste-compiler
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-haste-compiler
pkgver=0.4.4.1
pkgrel=2
pkgdesc="Haskell To ECMAScript compiler"
url="http://haste-lang.org/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-http=4000.2.19-4"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-bzlib=0.5.0.5-1"
         "haskell-data-binary-ieee754=0.4.4-4"
         "haskell-data-default=0.5.3-59"
         "haskell-either=4.3.2.1-3"
         "haskell-ghc-paths=0.1.0.9-57"
         "haskell-monads-tf=0.1.0.2-3"
         "haskell-mtl=2.1.3.1-5"
         "haskell-network=2.6.0.2-2"
         "haskell-network-uri=2.6.0.1-5"
         "haskell-random=1.1-1"
         "haskell-shellmate=0.1.6-2"
         "haskell-system-fileio=0.3.16-4"
         "haskell-tar=0.4.0.1-58"
         "haskell-utf8-string=0.3.8-3"
         "haskell-websockets=0.9.2.2-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("08bb2d3e1c756d872ba17e4e66341ad177931953804cc5fbcf8d79e03cff28c1")

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
            -f-only-library -f-static -f-portable
    runhaskell Setup build
    #runhaskell Setup haddock --hoogle --html
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
