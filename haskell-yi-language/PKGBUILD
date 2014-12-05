# Maintainer: Colin Woodbury <colingw@gmail.com>
_hkgname=yi-language
pkgname=haskell-yi-language
pkgver=0.1.0.8
pkgrel=1
pkgdesc="Collection of language-related Yi libraries."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL-2')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc'
         'alex'
         'derive'
         'haskell-array'
         'haskell-binary'
         'haskell-containers'
         'haskell-data-default'
         'haskell-hashable>=1.1.2.5'
         'haskell-lens>=4.5'
         'haskell-oo-prototypes'
         'haskell-pointedlist>=0.5'
         'haskell-regex-base'
         'haskell-regex-tdfa<1.3'
         'haskell-template-haskell'
         'haskell-transformers-base'
         'haskell-unordered-containers<0.3')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('2612e3941cb6b2fbf9d3aa7fd8a78e06')
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
}
