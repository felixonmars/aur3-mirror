pkgname=2gis-kurgan
pkgver=95
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-95.orig.zip")
md5sums=('57a51a805cd5f53b9e37c7daf9809499')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/kurgan.dgdat" || return 1
  
}
