pkgname=2gis-kurgan
pkgver=93
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://kurgan.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Kurgan-93.orig.zip")
md5sums=('f82c50051ef0e976404b1ab5c26d8549')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/kurgan.dgdat" || return 1
  
}
