pkgname=2gis-ryazan
pkgver=28
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, August 2013"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-28.orig.zip")
md5sums=('f62dadff3a2df4dda307675f6b2cb437')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ryazan.dgdat" "${pkgdir}/opt/2gis/ryazan.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Ryazan.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/ryazan.dglf" || return 1
}
