# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=yaml2owl
pkgver=0.0.1
pkgrel=1
pkgdesc="Generate OWL schema from YAML syntax, and an RDFa template."
url="http://hackage.haskell.org/package/${pkgname}"
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-containers' 'haskell-directory' 'haskell-filepath' 'haskell-network' 'haskell-swish>=0.8' 'haskell-text' 'haskell-xml>=1.3' 'haskell-yaml>=0.8.4')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f6c3e7a9a506a860f34f0776efe35fd0')
build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}
