# Maintainer: David Couzelis <drcouzelis@gmail.com>

pkgname=enbudget
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple application that uses the envelope system to help you budget your money."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/enbudget/"
license=('GPL')
depends=('wxpython')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('0436a5a6ab24786b5da83f634388b7dc')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}
  install -Dm644 ${pkgname}/icons/${pkgname}48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
