# custom variables
_hkgname=testpack
_licensefile=COPYRIGHT

# PKGBUILD options/directives
pkgname=haskell-testpack
pkgver=2.1.1
pkgrel=1
pkgdesc="Test Utililty Pack for HUnit and QuickCheck"
url="http://hackage.haskell.org/cgi-bin/hackage-scripts/package/testpack"
license=("LGPL")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "sh"
         "haskell-hunit=1.2.2.3"
         "haskell-quickcheck=2.4.0.1"
         "haskell-containers=0.4.0.0"
         "haskell-mtl=2.0.1.0"
         "haskell-random=1.0.0.3")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("afc2cd992263112e08beaebf3c75b47d885574659ce093e7810124bf611f0ffd")

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
