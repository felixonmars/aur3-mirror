# Maintainer: Benjamin Bukowski <bbukowski@posteo.de>

pkgname=xcursor-bridge
pkgver=1.0.0
pkgrel=1
pkgdesc="Bridge cursor set designed for KDE"
arch=('any')
url="http://kde-look.org/content/show.php/Bridge?content=164587"
license=('GPL')
depends=('libxcursor')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-look.org/CONTENT/content-files/164587-bridge.tar.gz")
md5sums=('e2c5f67efa61ce4d0a27ed3d1a6229c3')

package() {
  install -d ${pkgdir}/usr/share/icons/Bridge
  cp -r ${srcdir}/bridge/* ${pkgdir}/usr/share/icons/Bridge
}
