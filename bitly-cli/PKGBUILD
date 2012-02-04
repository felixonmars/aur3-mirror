# Maintainer: Sergey Astanin <s PUNTO astanin CHIOCCIOLA gmail PUNTO com>
_hkgname=bitly-cli
pkgname=bitly-cli
pkgver=0.1.2
pkgrel=1
pkgdesc="A command line tool to access bit.ly URL shortener."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-bitly>=0.0.7' 'haskell-directory>=1.0' 'haskell-filepath>=1.1' 'haskell-regexpr')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
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
md5sums=('9b1298c65bda0d5215ed1786fbe5109b')
