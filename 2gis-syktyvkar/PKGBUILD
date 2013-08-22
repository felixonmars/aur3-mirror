pkgname=2gis-syktyvkar
pkgver=17
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-17.orig.zip")
md5sums=('72be2f026d6a2bc7ec76fba8f87cdaec')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat" "${pkgdir}/opt/2gis/syktyvkar.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Syktyvkar.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/syktyvkar.dglf" || return 1
}
