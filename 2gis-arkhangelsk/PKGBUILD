pkgname=2gis-arkhangelsk
pkgver=29
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-29.orig.zip")
md5sums=('9350a6c63916fcc2b215ba888c598952')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/arkhangelsk.dgdat" || return 1
  
}
