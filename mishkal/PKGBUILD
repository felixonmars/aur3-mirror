# Maintainer: Walid Ziouche <01walid@gmail.com>
pkgname=mishkal
pkgver=20121231
pkgrel=1
pkgdesc="PyQt based desktop application for Arabic text vocalization"
url="http://tahadz.com/mishkal/"
license=('GPL')
groups=('arabic-extra-tools')
depends=('python2-pyqt')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('9f6341ea186021435f498bea23a19a43')
arch=('any')

build() {
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/{pixmaps,applications}/
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp $srcdir/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  cp $srcdir/${pkgname}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
  chmod +x ${pkgdir}/usr/bin/${pkgname}
  cp $srcdir/${pkgname}/ar/images/appicon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  cp -r $srcdir/${pkgname}/* ${pkgdir}/opt/${pkgname}/
}
# vim:set ts=2 sw=2 et:
