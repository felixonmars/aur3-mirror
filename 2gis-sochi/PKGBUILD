pkgname=2gis-sochi
pkgver=43
pkgrel=1
pkgdesc="Map of Sochi for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://sochi.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Sochi-43.orig.zip")
md5sums=('620dea549e218690eaff94508ff9f1a9')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sochi.dgdat" "${pkgdir}/opt/2gis/sochi.dgdat" || return 1
  
}
