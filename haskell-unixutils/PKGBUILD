# custom variables
_hkgname=Unixutils
_licensefile=COPYING

# PKGBUILD options/directives
pkgname=haskell-unixutils
pkgver=1.46
pkgrel=3
pkgdesc="A crude interface between Haskell and Unix-like operating systems"
url="http://src.seereason.com/haskell-unixutils"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "haskell-hunit=1.2.2.3-2.1"
         "haskell-mtl=2.0.1.0-3.1"
         "haskell-parallel=3.1.0.1-3.1"
         "haskell-puremd5=2.1.0.3-25"
         "haskell-regex-tdfa=1.1.8-18"
         "haskell-unix=2.4.2.0-2"
         "haskell-zlib=0.5.3.1-2.1")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("e7fb14a443a588d4e210bb0be99ec4d2bdf71829a27777bc6668c4f63efe14e1")

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
