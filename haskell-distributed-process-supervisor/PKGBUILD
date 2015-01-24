# custom variables
_hkgname=distributed-process-supervisor
_licensefile=LICENCE

# PKGBUILD options/directives
pkgname=haskell-distributed-process-supervisor
pkgver=0.1.2
pkgrel=3
pkgdesc="Supervisors for The Cloud Haskell Application Platform"
url="http://github.com/haskell-distributed/distributed-process-supervisor"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.8.4-1"
         "haskell-data-accessor=0.2.2.6-2"
         "haskell-distributed-process=0.5.3-4"
         "haskell-distributed-process-client-server=0.1.2-3"
         "haskell-distributed-process-extras=0.2.0-3"
         "haskell-fingertree=0.1.0.0-2"
         "haskell-hashable=1.2.3.1-2"
         "haskell-mtl=2.1.3.1-5"
         "haskell-stm=2.4.4-2"
         "haskell-unordered-containers=0.2.5.1-6")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("417e183e57d0d4548267abf8cebc95d282c006263b929f3bd262d528ffd459ac")

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
