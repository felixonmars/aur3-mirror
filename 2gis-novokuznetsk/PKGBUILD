pkgname=2gis-novokuznetsk
pkgver=101
pkgrel=1
pkgdesc="Map of Novokuznetsk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://novokuznetsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Novokuznetsk-101.orig.zip")
md5sums=('5e6c9f41ad4307199c70ea066f759874')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Novokuznetsk.dgdat" "${pkgdir}/opt/2gis/novokuznetsk.dgdat" || return 1
  
}
