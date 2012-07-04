# Contributor: Arch Haskell Team <arch-haskell@haskell.org>
# Contributor: Lex Black <autumn-wind at web dot de>

_hkgname=ztail
pkgname=ztail
pkgver=1.0.2
pkgrel=1
pkgdesc="Multi-file, colored, filtered log tailer."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc' 'haskell-hinotify' 'haskell-regex-compat<=0.95.1')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('7d160dd8cb88ebbef7d6976a241c2590')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure --prefix=/usr --docdir=/usr/share/doc/${pkgname} -O
    runhaskell Setup build
}
package() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup copy --destdir=${pkgdir}
}

# Original makedependrow:
# makedepends=('ghc' 'haskell-array=0.3.0.1' 'haskell-hinotify' 'haskell-old-locale=1.0.0.2' 'haskell-process=1.0.1.3' 'haskell-regex-compat=0.93.1' 'haskell-time=1.1.4' 'haskell-unix=2.4.0.2')
# not sure about that stuff. Most of it got included in ghc (in higher versions)

