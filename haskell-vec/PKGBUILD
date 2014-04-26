# Maintainer: André van Delden <andre.van.deldenX@Xuni-bremen.de>

_hkgname=Vec
pkgname=haskell-vec
pkgver=1.0.1
pkgrel=1

pkgdesc="A vector library containing a small but useful set of linear algebra operations: matrix multiplication, determinants, solving linear systems, inverting matrices."

url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
depends=('ghc')
options=('strip' 'staticlibs')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install="${pkgname}.install"
sha512sums=('a6d38f762eeae239b5ef1650b2909004b35c034d9174a05f32985fd68cc810e2a36b97d53b309fee8d9d24f98812dc647e9cbaa3de2ab2badaad692ac7ff91d0')

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
