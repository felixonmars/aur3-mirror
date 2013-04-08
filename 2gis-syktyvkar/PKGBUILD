pkgname=2gis-syktyvkar
pkgver=13
pkgrel=1
pkgdesc="Map of Syktyvkar for 2GIS, April 2013"
arch=('i686' 'x86_64')
url="http://syktyvkar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.2.2')
source=("http://download.2gis.ru/arhives/2GISData_Syktyvkar-13.orig.zip")
md5sums=('591d4fff07c14eb938c9b9c7717308a6')

package() {
  install -D -m 644 ${srcdir}/2gis/3.0/Data_Syktyvkar.dgdat "${pkgdir}/opt/2gis/city.dgdat" || return 1
  install -D -m 644 ${srcdir}/2gis/3.0/Plugins/DGisLan/Syktyvkar.dglf "${pkgdir}/opt/2gis/Plugins/DGisLan/Syktyvkar.dglf" || return 1
}
