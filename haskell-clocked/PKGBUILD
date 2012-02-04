# Maintainer: Hakim <acrox999[at]gmail[dot]com>
_hkgname=clocked
pkgname=haskell-clocked
pkgver=0.4.1
pkgrel=1
pkgdesc="timer functionality to clock IO commands"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL-3')
arch=('i686' 'x86_64')
depends=('ghc' 'haskell-monadcatchio-transformers' 'haskell-clock' 'haskell-containers=0.4.0.0' 'haskell-transformers=0.2.2.0' 'gcc-libs' 'qt-private-headers')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('b6698b284e66e4e9cd411c194f58940f')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O ${PKGBUILD_HASKELL_ENABLE_PROFILING:+-p } --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=/usr/lib/ghc-7.0.3/site-local/\$pkgid
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
