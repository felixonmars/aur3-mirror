# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=http-client
pkgname=haskell-http-client
pkgver=0.4.7.1
pkgrel=1
pkgdesc="An HTTP client engine, intended as a base layer for more user-friendly packages."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:MIT')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
         'haskell-array'
         'haskell-base64-bytestring<1.1'
         'haskell-blaze-builder>=0.3'
         'haskell-bytestring'
         'haskell-case-insensitive>=1.0'
         'haskell-containers'
         'haskell-cookie'
         'haskell-data-default-class'
         'haskell-deepseq'
         'haskell-exceptions>=0.4'
         'haskell-filepath'
         'haskell-http-types>=0.8'
         'haskell-mime-types'
         'haskell-network'
         'haskell-network-uri>=2.6'
         'haskell-publicsuffixlist'
         'haskell-random'
         'haskell-streaming-commons<0.2'
         'haskell-text'
         'haskell-time'
         'haskell-transformers')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('5a2a3442396e734a3261a42e619480d1')
install=${pkgname}.install
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
