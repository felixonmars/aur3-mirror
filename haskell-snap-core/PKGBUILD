# custom variables
_hkgname=snap-core
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-snap-core
pkgver=0.9.6.4
pkgrel=3
pkgdesc="Snap: A Haskell Web Framework (core interfaces and types)"
url="http://snapframework.com/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-hunit=1.2.5.2-57"
         "haskell-monadcatchio-transformers=0.3.1.0-58"
         "haskell-attoparsec=0.12.1.2-4"
         "haskell-attoparsec-enumerator=0.3.3-4"
         "haskell-blaze-builder=0.3.3.4-4"
         "haskell-blaze-builder-enumerator=0.2.0.6-3"
         "haskell-case-insensitive=1.2.0.3-4"
         "haskell-enumerator=0.4.20-8"
         "haskell-hashable=1.2.3.1-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-random=1.1-1"
         "haskell-regex-posix=0.95.2-58"
         "haskell-text=1.2.0.4-1"
         "haskell-unix-compat=0.4.1.4-1"
         "haskell-unordered-containers=0.2.5.1-6"
         "haskell-vector=0.10.12.2-2"
         "haskell-zlib-enum=0.2.3.1-3")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("71d3e4133a5da4d0ec8b3feb71996f60c9280bc84a01472bca9151167d2fef2b")

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
            -f-debug -fportable
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
