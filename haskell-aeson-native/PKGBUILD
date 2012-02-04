# custom variables
_hkgname=aeson-native
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-aeson-native
pkgver=0.3.3.1
pkgrel=2
pkgdesc="Fast JSON parsing and encoding"
url="http://github.com/mailrank/aeson"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "haskell-attoparsec=0.9.1.2-1"
         "haskell-blaze-builder=0.3.0.1-18"
         "haskell-blaze-textual-native=0.2.1-2"
         "haskell-deepseq=1.1.0.2-2.1"
         "haskell-hashable=1.1.2.2-1"
         "haskell-mtl=2.0.1.0-3.1"
         "haskell-syb=0.3-2.1"
         "haskell-text=0.11.0.5-2.1"
         "haskell-unordered-containers=0.1.4.3-2"
         "haskell-vector=0.9-1")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("377db6fd589ad094e95fa445eb86da4d256a3dd3a8ad87375fb3fa1d8b1be394")

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
        --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
