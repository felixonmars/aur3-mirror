# Maintainer: André van Delden <andre.van.delden@uni-bremen.de>

_hkgname=adjunctions
pkgname=haskell-adjunctions
pkgver=4.2
pkgrel=1
pkgdesc="Adjunctions and representable functors"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-array=0.3.0.2' 'haskell-comonad<5' 'haskell-containers=0.4.0.0' 'haskell-contravariant<2' 'haskell-distributive<1' 'haskell-free<5' 'haskell-mtl=2.0.1.0' 'haskell-profunctors<5' 'haskell-semigroupoids<5' 'haskell-semigroups<1' 'haskell-tagged<1' 'haskell-transformers=0.2.2.0' 'haskell-void<1')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
sha512sums=('019f5e92982723edcc371e303aeaf9d04f5245b979feb1f17eb6c1a1af4a2982a6bde98f59b705b080b547c64349637e8acc43ebe913cc10c98a636be30ee505')
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
