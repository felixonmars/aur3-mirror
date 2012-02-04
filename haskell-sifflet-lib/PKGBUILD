# custom variables
_hkgname=sifflet-lib
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-sifflet-lib
pkgver=1.2.4
pkgrel=24
pkgdesc="Library of modules shared by sifflet and its
tests and its exporters."
url="http://mypage.iu.edu/~gdweber/software/sifflet/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "haskell-cairo=0.12.1-2"
         "haskell-fgl=5.4.2.3-4.1"
         "haskell-glib=0.12.1-2"
         "haskell-gtk=0.12.1-2"
         "haskell-hxt=9.1.4-2"
         "haskell-mtl=2.0.1.0-3.1"
         "haskell-parsec=3.1.1-2.1"
         "haskell-unix=2.4.2.0-2"
         "gtk2")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("36502edf3a4579267511f3c9061187a175c13b052da5b6cde8c6728409671d56")

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    
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
    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/${_licensefile}
}
