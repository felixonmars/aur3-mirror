# Maintainer: Simon Brand <tartanllama@gmail.com>

# PKGBUILD options/directives
pkgname=haskell-strict
pkgver=0.3.2
pkgrel=20
pkgdesc="Strict data types and String IO."
url="http://www.cse.unsw.edu.au/~rl/code/strict.html"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc>=7.0.3-2" "sh" "haskell-array>=0.3.0.2")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/strict/${pkgver}/strict-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("2cd35a67938db635a87617d9576d5df0158b581e8e5694f07487c0f4b1549221")

# PKGBUILD functions
build() {
    cd ${srcdir}/strict-${pkgver}

    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
        --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
        --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register --gen-script
    runhaskell Setup unregister --gen-script
    sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

package() {
    cd ${srcdir}/strict-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/strict
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
