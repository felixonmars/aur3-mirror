# Contributor: Temhil and Frost
# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=xbmc-addon-repo-installer
pkgver=1.0.5
pkgrel=2
pkgdesc="Allows installation of unofficial xbmc addon repositories (from xbmc wiki)"
arch=('any')
url="http://passion-xbmc.org/index.php"
license=('GPL')
depends=('xbmc')
install=install
makedepends=('unzip')
source=('http://passion-xbmc.org/addons/Download.php/plugin.program.repo.installer/plugin.program.repo.installer-'$pkgver'.zip')
package() {
	mkdir -p ${pkgdir}/usr/share/xbmc/addons
	unzip ${srcdir}/plugin.program.repo.installer-${pkgver}.zip -d ${pkgdir}/usr/share/xbmc/addons
}
#
md5sums=('15e810a733fbf14d77b53301739a9f70')
