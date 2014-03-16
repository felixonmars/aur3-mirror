pkgname=2gis-bryansk
pkgver=25
pkgrel=1
pkgdesc="Map of Bryansk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://bryansk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Bryansk-25.orig.zip")
md5sums=('324301fd43c7a3930b48d008b0f2fcdc')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bryansk.dgdat" "${pkgdir}/opt/2gis/bryansk.dgdat" || return 1
  
}
