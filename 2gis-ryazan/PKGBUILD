pkgname=2gis-ryazan
pkgver=34
pkgrel=1
pkgdesc="Map of Ryazan for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://ryazan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ryazan-34.orig.zip")
md5sums=('5901acb9f50dfef0eaa02fa16eace881')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ryazan.dgdat" "${pkgdir}/opt/2gis/ryazan.dgdat" || return 1
  
}
