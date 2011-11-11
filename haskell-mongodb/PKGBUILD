# custom variables
_hkgname=mongoDB
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-mongodb
pkgver=1.1.0
pkgrel=6
pkgdesc="Driver (client) for MongoDB, a free, scalable, fast, document DBMS"
url="http://github.com/TonyGen/mongoDB-haskell"
license=("OtherLicense")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "haskell-binary=0.5.0.2-8"
         "haskell-bson=0.1.6-4"
         "haskell-cryptohash=0.7.4-1"
         "haskell-monad-control=0.2.0.3-2"
         "haskell-mtl=2.0.1.0-3.1"
         "haskell-network=2.3.0.2-2.1"
         "haskell-parsec=3.1.1-2.1"
         "haskell-random-shuffle=0.0.2-1")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("03d9e13ab4b8c8c8f3273992aa0269a9884de098af94ee22abe6c8e86fa215af")

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
