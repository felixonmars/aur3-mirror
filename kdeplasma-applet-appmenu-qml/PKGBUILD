# Maintainer: Wang Jiajun <amesists AT gmail DOT com>

pkgname=kdeplasma-applet-appmenu-qml
_pkgname=plasma-applet-appmenu-qml
pkgver=1.6
pkgrel=1
pkgdesc="This plasmoid shows a menu of the installed applications, similar to Lancelot but much simpler."
arch=(any)
url="http://kde-apps.org/content/show.php?content=146098"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('unzip')
source=(http://kde-apps.org/CONTENT/content-files/146098-${_pkgname}-${pkgver}.plasmoid)
md5sums=('4b583606c08fa50546c93772cd810852')

package() {
  unzip -o -q "$srcdir/146098-${_pkgname}-${pkgver}.plasmoid" -d "$srcdir/${_pkgname}"
  install -D $srcdir/${_pkgname}/metadata.desktop ${pkgdir}/"`kde4-config --prefix`/share/kde4/services/${_pkgname}.desktop"
  mkdir -p ${pkgdir}/"`kde4-config --prefix`/share/apps/plasma/plasmoids/appmenu-qml"
  cp -r $srcdir/${_pkgname}/* ${pkgdir}/"`kde4-config --prefix`/share/apps/plasma/plasmoids/appmenu-qml/"
}
