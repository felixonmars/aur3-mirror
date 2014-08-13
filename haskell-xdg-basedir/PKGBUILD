# Maintainer: Simon Brand <tartanllama@gmail.com>

# PKGBUILD options/directives
pkgname=haskell-xdg-basedir
pkgver=0.2.2
pkgrel=20
pkgdesc="A basic implementation of the XDG Base Directory specification."
url="http://github.com/willdonnelly/xdg-basedir"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc"
         "haskell-directory"
         "haskell-filepath")
options=('strip' 'staticlibs')
source=("http://hackage.haskell.org/packages/archive/xdg-basedir/${pkgver}/xdg-basedir-${pkgver}.tar.gz")
sha256sums=('e461c3a5c6007c55ceaea03be3be0ef3a92aa0ea1aea936da0c43671bbfaf42b')
install="${pkgname}.install"

# PKGBUILD functions
build() {
    cd ${srcdir}/xdg-basedir-${pkgver}

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
    cd ${srcdir}/xdg-basedir-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/xdg-basedir
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
