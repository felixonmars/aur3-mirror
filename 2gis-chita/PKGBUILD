pkgname=2gis-chita
pkgver=16
pkgrel=1
pkgdesc="Map of Chita for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://chita.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Chita-16.orig.zip")
md5sums=('96f941ba030cd80812d42461d3e3de0e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chita.dgdat" "${pkgdir}/opt/2gis/chita.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Chita.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/chita.dglf" || return 1
}
