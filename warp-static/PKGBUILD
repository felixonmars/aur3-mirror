# Maintainer: Leif Warner <abimelech@gmail.com>
_hkgname=warp-static
pkgname=warp-static
pkgver=1.3.0.1
pkgrel=1
pkgdesc="Static file server based on Warp and wai-app-static"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:MIT')
arch=('i686' 'x86_64')
makedepends=('haskell-bytestring' 'haskell-cmdargs>=0.6.7' 'haskell-containers' 'haskell-directory' 'haskell-mime-types<0.2' 'haskell-text' 'haskell-wai-app-static<1.4' 'haskell-wai-extra<1.4' 'haskell-warp<1.4')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('5621cf5537be759e980597d940290ef2')
build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}
