pkgname=2gis-bryansk
pkgver=24
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-24.orig.zip")
md5sums=('6c657adc1c2f8c0bfef38ef41eeaea7a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/bryansk.dgdat" || return 1
  
}
