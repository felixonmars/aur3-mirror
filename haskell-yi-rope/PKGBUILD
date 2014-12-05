# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=yi-rope
pkgname=haskell-yi-rope
pkgver=0.7.0.0
pkgrel=1
pkgdesc="A rope data structure used by Yi"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL-2')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
'haskell-binary'
'haskell-bytestring'
'haskell-charsetdetect-ae>=1.0.1'
'haskell-data-default'
'haskell-deepseq'
'haskell-fingertree'
'haskell-text'
'haskell-text-icu')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('d316671b21621171ef6a8447fd7dbaf4')
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
