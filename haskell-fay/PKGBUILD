# custom variables
_hkgname=fay
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-fay
pkgver=0.21.2.1
pkgrel=7
pkgdesc="A compiler for Fay, a Haskell subset that compiles to JavaScript."
url="https://github.com/faylang/fay/wiki"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-aeson=0.8.0.2-8"
         "haskell-data-default=0.5.3-59"
         "haskell-ghc-paths=0.1.0.9-57"
         "haskell-haskell-names=0.4.1-11"
         "haskell-haskell-packages=0.2.4.3-7"
         "haskell-haskell-src-exts=1.16.0.1-3"
         "haskell-language-ecmascript=0.16.2-12"
         "haskell-mtl=2.1.3.1-5"
         "haskell-optparse-applicative=0.11.0.1-3"
         "haskell-safe=0.3.8-2"
         "haskell-sourcemap=0.1.3.0-19"
         "haskell-split=0.2.2-57"
         "haskell-spoon=0.3.1-3"
         "haskell-syb=0.4.2-3"
         "haskell-text=1.2.0.3-1"
         "haskell-uniplate=1.6.12-71"
         "haskell-unordered-containers=0.2.5.1-5"
         "haskell-utf8-string=0.3.8-3"
         "haskell-vector=0.10.12.2-2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("d5d18eab9a7ce0542b80ae1fe026146a67131cd18cb8c4142c41951eea74321a")

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
