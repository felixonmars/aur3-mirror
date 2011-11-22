# Maintainer: Bernardo Barros <bernardobarros@gmail.com>
_hkgname=haskore
pkgname=haskell-haskore
pkgver=0.2.0.2
pkgrel=1
pkgdesc="The Haskore Computer Music System"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-array=0.3.0.2' 'haskell-bytestring=0.9.1.10' 'haskell-containers=0.4.0.0' 'haskell-data-accessor<0.3' 'haskell-event-list<0.2' 'haskell-haskell-src=1.0.1.4' 'haskell-markov-chain<0.1' 'haskell-midi<0.2' 'haskell-non-negative<0.2' 'haskell-parsec=3.1.1' 'haskell-process=1.0.1.5' 'haskell-random=1.0.0.3' 'haskell-transformers=0.2.2.0' 'haskell-utility-ht<0.1')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('47613d5937e9c0125bd1abe5c9329e72')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
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
}
