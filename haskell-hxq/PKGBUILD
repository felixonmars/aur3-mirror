# custom variables
_hkgname=HXQ
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-hxq
pkgver=0.19.0
pkgrel=1
pkgdesc="A Compiler from XQuery to Haskell"
url="http://lambda.uta.edu/HXQ/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "sh"
         "haskell-http=4000.1.1"
         "haskell-array=0.3.0.2"
         "haskell-haskeline=0.6.3.2"
         "haskell-haskell98=1.1.0.1"
         "haskell-mtl=2.0.1.0"
         "haskell-regex-base=0.93.2"
         "haskell-regex-compat=0.93.1"
         "haskell-template-haskell=2.5.0.0")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("f41cf8cfa3d9cc1c87fd3843e235e2b1155c0494751edc35dfc63b8bbce254cc")

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
