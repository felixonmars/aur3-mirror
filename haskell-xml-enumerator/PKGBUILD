# custom variables
_hkgname=xml-enumerator
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-xml-enumerator
pkgver=0.4.3.1
pkgrel=1
pkgdesc="Pure-Haskell utilities for dealing with XML with the enumerator package."
url="http://github.com/snoyberg/xml"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "haskell-attoparsec-text=0.8.5.1-19"
         "haskell-attoparsec-text-enumerator=0.2.0.0-23"
         "haskell-blaze-builder=0.3.0.1-18"
         "haskell-blaze-builder-enumerator=0.2.0.3-2"
         "haskell-data-default=0.3.0-1"
         "haskell-enumerator=0.4.15-1"
         "haskell-failure=0.1.0.1-18"
         "haskell-text=0.11.0.5-2.1"
         "haskell-transformers=0.2.2.0-3.1"
         "haskell-xml-types=0.3-18")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("f0335878981ac4f40b7857951b4858dffed0052af38acdcd8bd22a85372829c9")

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
