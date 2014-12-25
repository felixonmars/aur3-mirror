# custom variables
_hkgname=ghcjs-prim
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-ghcjs-prim
pkgver=0.1.0.0
pkgrel=1
pkgdesc="ghc-prim"
url="http://github.com/ghcjs"

license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.3-1")
options=('strip' 'staticlibs')
source=("${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('02ab011cbd01a77c36f2ccc6600689b833505a948c4bd9d08ac671066314dba4')

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

