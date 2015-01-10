# custom variables
_hkgname=yaml
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-yaml
pkgver=0.8.10.1
pkgrel=7
pkgdesc="Support for parsing and rendering YAML documents."
url="http://github.com/snoyberg/yaml/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-8"
         "haskell-attoparsec=0.12.1.2-3"
         "haskell-conduit=1.2.3.1-3"
         "haskell-enclosed-exceptions=1.0.1-6"
         "haskell-resourcet=1.1.3.3-3"
         "haskell-scientific=0.3.3.3-5"
         "haskell-text=1.2.0.3-1"
         "haskell-unordered-containers=0.2.5.1-5"
         "haskell-vector=0.10.12.2-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("e977912762e13571ec596173405ce328c8f7397aee4dd21f61ac9af762431ba9")

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
            -f-no-unicode -f-system-libyaml -f-no-exe
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
