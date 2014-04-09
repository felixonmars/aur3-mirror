pkgname=2gis-kurgan
pkgver=97
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-97.orig.zip")
md5sums=('c09bfaa0458c10d5dd418cca3c467d2f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/2gis-kurgan.dgdat" || return 1
  
}
