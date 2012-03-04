# OrigMaintainer: Arch Haskell Team <arch-haskell@haskell.org>
# Maintainer: Filip Brcic <brcha@gna.org>
_hkgname=HSFFIG
pkgname=hsffig
pkgver=1.1.3
pkgrel=5
pkgdesc="Generate FFI import declarations from C include files"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=()
depends=('gmp' 'ghc' 'haskell-parsec-2')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz HSFFIG-1.1.3-ghc74-bangpatterns.patch)
install=${pkgname}.install
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    patch -Np1 -i ../HSFFIG-1.1.3-ghc74-bangpatterns.patch
    runhaskell Setup configure -O --enable-split-objs --enable-shared \
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
    install -D -m644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
md5sums=('a7d9f9e556220825c7f5ddbd249698aa'
         '2375290e00d8d965a99f6d6ad65ecbf4')
