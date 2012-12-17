# Maintainer: Nicola Squartini <tensor5@gmail.com>
_hkgname=happstack-jmacro
pkgname=haskell-happstack-jmacro
pkgver=7.0.4
pkgrel=1
pkgdesc="Support for using JMacro with Happstack"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-base64-bytestring>=0.1' 'haskell-base64-bytestring<1.1' 'haskell-bytestring>=0.9' 'haskell-bytestring<0.11' 'haskell-cereal>=0.3' 'haskell-cereal<0.4' 'haskell-digest<0.1' 'haskell-happstack-server>=6.4' 'haskell-happstack-server<7.2' 'haskell-jmacro>=0.6' 'haskell-jmacro<0.7' 'haskell-text>=0.9' 'haskell-text<0.12' 'haskell-utf8-string>=0.3' 'haskell-utf8-string<0.4' 'haskell-wl-pprint-text>=1.1' 'haskell-wl-pprint-text<1.2')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('e95d7ea756e04687eaf8fa0fb834ea3a')
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
