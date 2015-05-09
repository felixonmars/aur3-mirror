# Maintainer: Aaron Peschel <aaron.peschel via gmail dot com>
# Contributor: Joop Kiefte <ikojba via gmail dot com>
_hkgname=blaze-markup
pkgname=haskell-blaze-markup
pkgver=0.7.0.2
pkgrel=1
pkgdesc="A blazingly fast markup combinator library for Haskell"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
# The following are provided by the ghc package
#   haskell-bytestring
#   haskell-base
# All others come from the AUR
depends=(
    'ghc'
    'haskell-base>=4.0'
    'haskell-base<5.0'
    'haskell-blaze-builder>=0.3'
    'haskell-blaze-builder<0.5'
    'haskell-bytestring>=0.9'
    'haskell-bytestring<0.11'
    'haskell-text>=0.10'
    'haskell-text<1.3'
)
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('9f3919d9d601cd94d31096d5be7d302a')
sha1sums=('b3cf020c1c8bf881a36b5baa4aa6dbbd8b42b316')
sha256sums=('e4068a284834d8fe68df5ec63a037b92b7c956a82c0c72d7beca8d670fd5725c')

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
