# Maintainer: André van Delden <andre.van.delden@uni-bremen.de>

_hkgname=either
pkgname=haskell-either
pkgver=4.3.3.2
pkgrel=1
pkgdesc="An either monad transformer"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-monadrandom<0.4' 'haskell-bifunctors<5' 'haskell-exceptions<0.9' 'haskell-free<5' 'haskell-monad-control<1.1' 'haskell-mtl=2.0.1.0' 'haskell-profunctors<5' 'haskell-semigroupoids<5' 'haskell-semigroups<1' 'haskell-transformers=0.2.2.0' 'haskell-transformers-base<0.5')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
sha512sums=('35b0825cb34fef8cb673b808110c856d3be4b02a28c52ac59d5b31e34083095e7e72d1ea437e70a43500064f7fdd2baf90ca078729907b975192401c240b19e5')
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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
