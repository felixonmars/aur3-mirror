# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=filesystem-conduit
pkgname=haskell-filesystem-conduit
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Use system-filepath data types with conduits."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:MIT')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-bytestring' 'haskell-conduit<1.1' 'haskell-containers' 'haskell-system-fileio<0.4' 'haskell-system-filepath<0.5' 'haskell-text' 'haskell-transformers' 'haskell-unix')
options=('staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('bfdc8a67daf21240922b82c45434de3c')
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
