# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_hkgname=hxt-http
_licensefile=LICENSE

pkgname=haskell-hxt-http
pkgver=9.1.4
pkgrel=1
pkgdesc="Interface to native Haskell HTTP package HTTP"
url="http://www.fh-wedel.de/~si/HXmlToolbox/index.html"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc"
    "haskell-base>=4.*"
    "haskell-bytestring>=0.9"
    "haskell-bytestring<1"
    "haskell-http>=4000"
    "haskell-http<5000"
    "haskell-hxt>=9.1"
    "haskell-hxt<10"
    "haskell-network>=2.1"
    "haskell-network<3"
    "haskell-parsec>=2.1"
    "haskell-parsec<4")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('e2895a3dfc59e29008f3f8a46002e743f7a8808677279fb2949681c15a38d39c')

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
