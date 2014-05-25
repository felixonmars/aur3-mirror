# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=mybb-pluginlibrary
_pkgname=MyBB-PluginLibrary
pkgver=12
pkgrel=1
pkgdesc="German language package"
install=mybb-pluginlibrary.install
arch=('any')
url=('https://github.com/frostschutz/MyBB-PluginLibrary')
license=('GPL')
depends=('mybb')
source=("${_pkgname}::https://github.com/frostschutz/MyBB-PluginLibrary/archive/${pkgver}.tar.gz")
md5sums=('120e44041f0f86638efa2437e883f90a')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/mybb/inc
  
  cp -ra ${srcdir}/${_pkgname}-${pkgver}/inc/plugins ${pkgdir}/usr/share/webapps/mybb/inc/plugins
}
