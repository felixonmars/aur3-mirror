# Maintainer: Alexander Rødseth <rodseth@gmail.com>
_hkgname=Raincat
pkgname=raincat
pkgver=1.1.1.2
pkgrel=4
pkgdesc="Guide the fuzzy cat to safety"
url="http://raincat.bysusanlin.com/"
license=('custom:BSD3')
arch=('x86_64' 'i686')
makedepends=('ghc' 'haskell-glut>=2.1.2.1' 'haskell-opengl>=2.2.3.0' 'haskell-sdl>=0.6.2' 'haskell-sdl-image>=0.6.1' 'haskell-sdl-mixer>=0.6.1' 'haskell-containers>=0.3.0.0' 'haskell-extensible-exceptions>=0.1.1.1' 'haskell-mtl' 'haddock')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('13574caddc5dc01d387c040db5a09c8d')

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

# vim:set ts=2 sw=2 et:
