# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

_hkgname=bluetile
pkgname=bluetile
pkgver=0.6
pkgrel=1
pkgdesc="full-featured tiling for the GNOME desktop environment"
url="http://hackage.haskell.org/package/${_hkgname}"
license=('custom:BSD3')
arch=('i686' 'x86_64')
makedepends=('ghc'
	'haskell-configfile'
	'haskell-containers'
	'haskell-directory'
	'haskell-filepath'
	'haskell-glade'
	'haskell-gtk'
	'haskell-mtl'
	'haskell-process'
	'haskell-random'
	'haskell-regex-compat'
	'haskell-unix'
	'haskell-utf8-string'
	'haskell-x11>=1.4'
	'haskell-x11-xft'
	'xmonad'
	'xmonad-contrib')
depends=('gmp')
options=('strip')
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('5e1d097768f4751a2ae2756ae469a7b4')

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
