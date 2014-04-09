pkgname=2gis-khabarovsk
pkgver=41
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-41.orig.zip")
md5sums=('84afb93d9d5e72dbeef8b3099de5a552')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/2gis-khabarovsk.dgdat" || return 1
  
}
