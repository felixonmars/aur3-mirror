# custom variables
_hkgname=data-object-yaml
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-data-object-yaml
pkgver=0.3.3.5
pkgrel=22
pkgdesc="Serialize data to and from Yaml files"
url="http://github.com/snoyberg/data-object-yaml"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "sh"
         "haskell-bytestring=0.9.1.10"
         "haskell-containers=0.4.0.0"
         "haskell-convertible-text=0.3.0.10"
         "haskell-data-object=0.3.1.7"
         "haskell-enumerator=0.4.14"
         "haskell-failure=0.1.0.1"
         "haskell-text=0.11.0.5"
         "haskell-transformers=0.2.2.0"
         "haskell-yaml=0.4.1.1")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("dc8c6d4de991a0b7ac988e2dcf6f9eec1fabc7d1c32805d37337129998cae029")

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
