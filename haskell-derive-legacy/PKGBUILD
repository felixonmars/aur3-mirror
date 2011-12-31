# custom variables
_hkgname=derive
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=haskell-derive-legacy
pkgver=2.4.2
pkgrel=2
pkgdesc="A program and library to derive instances for data types"
url="http://community.haskell.org/~ndm/derive/"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=('ghc')
depends=("ghc"
         "haskell-haskell-src-exts-legacy"
         "haskell-syb"
         "haskell-transformers"
         "haskell-uniplate")
provides=('haskell-derive')
conflicts=('haskell-derive')
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
sha256sums=('79291c6443a4b9a4a8bd44e156ccf9d235444677f6397201f7bdc7e48827314b')
install="${pkgname}.install"

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
