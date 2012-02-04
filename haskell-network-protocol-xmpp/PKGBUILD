# custom variables
_hkgname=network-protocol-xmpp
_licensefile=License.txt

# PKGBUILD options/directives
pkgname=haskell-network-protocol-xmpp
pkgver=0.4
pkgrel=23
pkgdesc="Client->Server XMPP"
url="https://john-millikin.com/software/hs-xmpp/"
license=("GPL-3")
arch=('i686' 'x86_64')
makedepends=()
depends=("ghc=7.0.3-2"
         "sh"
         "haskell-bytestring=0.9.1.10"
         "haskell-gnuidn=0.2"
         "haskell-gnutls=0.1"
         "haskell-gsasl=0.3.2"
         "haskell-libxml-sax=0.7.2"
         "haskell-monads-tf=0.1.0.0"
         "haskell-network=2.3.0.2"
         "haskell-text=0.11.0.5"
         "haskell-transformers=0.2.2.0"
         "haskell-xml-types=0.3")
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=("a6ea62a4c6b46825fb6f4c897257d61cf88a960aa00d333a7e9cea962bf6d369")

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
