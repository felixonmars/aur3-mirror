# custom variables
_hkgname=pxsl-tools
_licensefile=LICENSE

# PKGBUILD options/directives
pkgname=pxsl-tools
pkgver=1.0.1
pkgrel=18
pkgdesc="Parsimonious XML Shorthand Language--to-XML compiler"
url="http://community.moertel.com/ss/space/PXSL"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=("ghc=7.0.3-2"
             "haskell-containers=0.4.0.0"
             "haskell-mtl=2.0.1.0"
             "haskell-parsec=3.1.1")
depends=()
options=('strip')
source=("http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz")

sha256sums=("dc311c012b0b6b482cdd26337f44cff8259269d3dd83f482ab4049965fa085e0")

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
