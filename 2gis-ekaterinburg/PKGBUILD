pkgname=2gis-ekaterinburg
pkgver=100
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-100.orig.zip")
md5sums=('ac1e34f3eab5848d5a860ceedc82403c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/2gis-ekaterinburg.dgdat" || return 1
  
}
