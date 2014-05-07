pkgname=2gis-ulanude
pkgver=40
pkgrel=1
pkgdesc="Map of Ulan-Ude for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://ulan-ude.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulanude-40.orig.zip")
md5sums=('579fc67e85c718660e3f1204c6969adf')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulanude.dgdat" "${pkgdir}/opt/2gis/2gis-ulanude.dgdat" || return 1
  
}
