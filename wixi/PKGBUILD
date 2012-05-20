# Maintainer: M Rawash <mrawash@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Eric Forgeot

pkgname=wixi
pkgver=1.10
pkgrel=2
pkgdesc="A multi-platform wiki application for the desktop, written in wxpython."
arch=('any')
url="http://wixi.sourceforge.net/"
license=('GPL')
depends=('wxpython' 'python2')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.zip \
	${pkgname}.desktop)
md5sums=('4990785f5a35f9403489ca52940e846f'
	 'b2039fad5596660bdee3b89507ea51a4')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
