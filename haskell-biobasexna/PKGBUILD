# custom variables
_hkgname=BiobaseXNA
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-biobasexna
pkgver=0.8.3.0
pkgrel=6
pkgdesc="Efficient RNA/DNA representations"
url="http://www.tbi.univie.ac.at/~choener/"
license=("GPL-3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-primitivearray=0.5.4.0-5"
         "haskell-cmdargs=0.10.12-3"
         "haskell-csv=0.1.2-68"
         "haskell-file-embed=0.0.7.1-1"
         "haskell-mtl=2.1.3.1-5"
         "haskell-primitive=0.5.4.0-2"
         "haskell-repa=3.3.1.2-4"
         "haskell-text=1.2.0.4-1"
         "haskell-tuple=0.3.0.2-2"
         "haskell-vector=0.10.12.2-2"
         "haskell-vector-th-unbox=0.2.1.0-8")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("c99a560e969fbad712abe6f33f84dc7cc058c0f4bbf5d42cefb13345e1a9187c")

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
