# Maintainer: David Couzelis <drcouzelis@gmail.com>

pkgname=divvyup
pkgver=0.5
pkgrel=1
pkgdesc="A simple application that uses the envelope system to help you budget your money."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/enbudget/"
license=('GPL')
depends=('wxpython')
source=(http://downloads.sourceforge.net/enbudget/${pkgname}-${pkgver}.tar.gz)
md5sums=('36fd5a2004bee5012ca90be7a4637d9b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}
  install -Dm644 ${pkgname}/icons/${pkgname}48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
