# Maintainer: Jan Stępień <jstepien@users.sourceforge.net>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=criterion
pkgname=haskell-criterion
pkgver=0.6.0.1
pkgrel=1
pkgdesc="Robust, reliable performance measurement and analysis"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-aeson>=0.3.2.12' 'haskell-bytestring=0.9.1.10' 'haskell-containers=0.4.0.0' 'haskell-deepseq=1.1.0.2' 'haskell-directory=1.1.0.0' 'haskell-filepath=1.2.0.0' 'haskell-hastache>=0.1.5' 'haskell-mtl=2.0.1.0' 'haskell-mwc-random>=0.8.0.3' 'haskell-parsec=3.1.1' 'haskell-statistics>=0.10.0.0' 'haskell-time=1.2.0.3' 'haskell-transformers=0.2.2.0' 'haskell-vector>=0.7.1' 'haskell-vector-algorithms>=0.4')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('1b8cdb199df3a759e91c079e53d0cb94')
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
