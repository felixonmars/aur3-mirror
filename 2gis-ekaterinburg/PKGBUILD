pkgname=2gis-ekaterinburg
pkgver=95
pkgrel=1
pkgdesc="Map of Ekaterinburg for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://ekaterinburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ekaterinburg-95.orig.zip")
md5sums=('45bf6c826ae61f4a2c329ff37a75b605')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ekaterinburg.dgdat" "${pkgdir}/opt/2gis/ekaterinburg.dgdat" || return 1
  
}
