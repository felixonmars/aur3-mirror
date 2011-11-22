# Maintainer: Bernardo Barros <bernardobarros@gmail.com>
_hkgname=midi
pkgname=haskell-midi
pkgver=0.1.6
pkgrel=1
pkgdesc="Handling of MIDI messages and files"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-quickcheck=2.4.0.1' 'haskell-binary<0.6' 'haskell-bytestring=0.9.1.10' 'haskell-event-list<0.2' 'haskell-explicit-exception<0.2' 'haskell-monoid-transformer<0.1' 'haskell-non-negative<0.2' 'haskell-random=1.0.0.3' 'haskell-transformers=0.2.2.0')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('29f26204fedb8028b71f5359eb6d476f')
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
