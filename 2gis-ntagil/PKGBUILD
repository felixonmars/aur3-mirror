pkgname=2gis-ntagil
pkgver=34
pkgrel=1
pkgdesc="Map of Nizhny Tagil for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://nizhniy-tagil.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ntagil-34.orig.zip")
md5sums=('255228b438d74fa122934b0ef1d3e13b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ntagil.dgdat" "${pkgdir}/opt/2gis/2gis-ntagil.dgdat" || return 1
  
}
