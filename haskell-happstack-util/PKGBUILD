# custom variables
_hkgname=happstack-util
_licensefile=COPYING

# PKGBUILD options/directives
pkgname=haskell-happstack-util
pkgver=6.0.0
pkgrel=21
pkgdesc="Web framework"
url="http://happstack.com"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "sh"
         "haskell-array=0.3.0.2"
         "haskell-bytestring=0.9.1.10"
         "haskell-directory=1.1.0.0"
         "haskell-extensible-exceptions=0.1.1.2"
         "haskell-filepath=1.2.0.0"
         "haskell-hslogger=1.1.5"
         "haskell-mtl=2.0.1.0"
         "haskell-network=2.3.0.2"
         "haskell-old-locale=1.0.0.2"
         "haskell-old-time=1.0.0.6"
         "haskell-parsec=3.1.1"
         "haskell-process=1.0.1.5"
         "haskell-random=1.0.0.3"
         "haskell-template-haskell=2.5.0.0"
         "haskell-time=1.2.0.3"
         "haskell-unix=2.4.2.0"
         "haskell-unix-compat=0.2.2.1")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("9f7806ecf7ad517849ef00559812a6de6646b4093329477706189535c951141b")

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
