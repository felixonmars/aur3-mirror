# custom variables
_hkgname=numeric-prelude
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-numeric-prelude
pkgver=0.2.2.1
pkgrel=1
pkgdesc="An experimental alternative hierarchy of numeric type classes"
url="http://www.haskell.org/haskellwiki/Numeric_Prelude"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "sh"
         "haskell-quickcheck=2.4.0.1"
         "haskell-array=0.3.0.2"
         "haskell-containers=0.4.0.0"
         "haskell-non-negative=0.1"
         "haskell-parsec=3.1.1"
         "haskell-random=1.0.0.3"
         "haskell-storable-record=0.0.2.4"
         "haskell-utility-ht=0.0.7")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("aa89b5330d406c1266f87d92879c24dbf0bd7e3593fd315da679103740806289")

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
