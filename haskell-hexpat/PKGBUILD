# Maintainer: Arch Haskell Team <arch-haskell@haskell.org>
# Maintainer: Sean Bartell <wingedtachikoma@gmail.com>

_pkgname=hexpat
pkgname=haskell-hexpat
pkgver=0.20.7
pkgrel=1
pkgdesc="XML parser/formatter based on expat"
url="http://hackage.haskell.org/package/${_pkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('ghc' 'haskell-list' 'haskell-transformers' 'haskell-text' 'haskell-utf8-string' 'haskell-extensible-exceptions')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('df44dd03f9db50b93725d753c7a9119a')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    runhaskell Setup configure -O --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}
package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_pkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
