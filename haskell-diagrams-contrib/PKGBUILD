# custom variables
_hkgname=diagrams-contrib
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-diagrams-contrib
pkgver=1.1.2.5
pkgrel=1
pkgdesc="Collection of user contributions to diagrams EDSL"
url="http://projects.haskell.org/diagrams/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-monadrandom=0.3.0.1-3"
         "haskell-arithmoi=0.4.1.1-3"
         "haskell-circle-packing=0.1.0.4-1"
         "haskell-colour=2.3.3-57"
         "haskell-data-default=0.5.3-59"
         "haskell-data-default-class=0.0.1-57"
         "haskell-diagrams-core=1.2.0.5-1"
         "haskell-diagrams-lib=1.2.0.8-1"
         "haskell-force-layout=0.3.0.9-1"
         "haskell-lens=4.7-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-parsec=3.1.8-1"
         "haskell-semigroups=0.16.0.1-4"
         "haskell-split=0.2.2-58"
         "haskell-text=1.2.0.4-1"
         "haskell-vector-space=0.9-2"
         "haskell-vector-space-points=0.2.1-1")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("78ace7064de0cb7c9c0a257364cd9ca5609c781f22676f767ab82a57a54ceeb4")

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
