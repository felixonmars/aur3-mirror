# custom variables
_hkgname=happstack-state
_licensefile=COPYING

# PKGBUILD options/directives
pkgname=haskell-happstack-state
pkgver=6.1.2
pkgrel=2
pkgdesc="Event-based distributed state."
url="http://happstack.com"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "haskell-binary=0.5.0.2-8"
         "haskell-happstack-data=6.0.0-20"
         "haskell-happstack-util=6.0.2-1"
         "haskell-hslogger=1.1.5-1"
         "haskell-mtl=2.0.1.0-3.1"
         "haskell-stm=2.2.0.1-2.1"
         "haskell-syb=0.3-2.1"
         "haskell-unix=2.4.2.0-2")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("1d8e684fdbea79bc9cb87055d2c783412f74e87be3eb857793b1695bcec8388d")

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
