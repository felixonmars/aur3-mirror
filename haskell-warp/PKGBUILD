# custom variables
_hkgname=warp
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-warp
pkgver=3.0.5.1
pkgrel=1
pkgdesc="A fast, light-weight web server for WAI applications."
url="http://github.com/yesodweb/wai"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-auto-update=0.1.2.1-1"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-case-insensitive=1.2.0.3-4"
         "haskell-hashable=1.2.3.1-2"
         "haskell-http-date=0.0.4-75"
         "haskell-http-types=0.8.5-11"
         "haskell-iproute=1.3.1-1"
         "haskell-network=2.6.0.2-2"
         "haskell-simple-sendfile=0.2.18-2"
         "haskell-streaming-commons=0.1.8.1-1"
         "haskell-text=1.2.0.4-1"
         "haskell-unix-compat=0.4.1.4-1"
         "haskell-void=0.7-7"
         "haskell-wai=3.0.2.1-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("0732541655ead8278d40b1ad3f18d1559b784af242d8729971ffc95016d8cc7c")

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
            -f-warp-debug -fallow-sendfilefd -f-network-bytestring
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
