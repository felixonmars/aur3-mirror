# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
_hkgname=lhs2tex
pkgname=lhs2tex
pkgver=1.18.1
pkgrel=1
pkgdesc="Preprocessor for typesetting Haskell sources with LaTeX"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-mtl' 'haskell-regex-compat')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('31fc73ebabdd2daa49fbd58dbecf3d4b')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
