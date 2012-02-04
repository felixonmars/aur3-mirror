# custom variables
_hkgname=hxmppc
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=hxmppc
pkgver=0.2.3
pkgrel=1
pkgdesc="Haskell XMPP (Jabber Client) Command Line Interface (CLI)"
url="http://hackage.haskell.org/package/${_hkgname}"
license=("BSD3")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-fclabels=1.0.4"
             "haskell-network=2.3.0.2"
             "haskell-network-protocol-xmpp=0.4"
             "haskell-text=0.11.0.5"
             "haskell-transformers=0.2.2.0"
             "haskell-xml-types=0.3")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("4972e692bad4327f63f607a87c4e877d4f34415433c370889bd697a4590f31bb")

# PKGBUILD functions
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O --prefix=/usr --docdir=/usr/share/doc/${pkgname}
    runhaskell Setup build
}

package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
