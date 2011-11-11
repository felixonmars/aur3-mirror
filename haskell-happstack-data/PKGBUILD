# custom variables
_hkgname=happstack-data
_licensefile=COPYING

# PKGBUILD options/directives
pkgname=haskell-happstack-data
pkgver=6.0.0
pkgrel=20
pkgdesc="Happstack data manipulation libraries"
url="http://happstack.com"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "haskell-binary=0.5.0.2-8"
         "haskell-mtl=2.0.1.0-3.1"
         "haskell-syb=0.3-2.1"
         "haskell-syb-with-class=0.6.1.2-1"
         "haskell-syb-with-class-instances-text=0.0.1-19"
         "haskell-text=0.11.0.5-2.1")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("147a3a0980391ff0b7a436be67e6d2682abf8123da0bae67203c0eff30f5bbf1")

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
