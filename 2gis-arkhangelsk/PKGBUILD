pkgname=2gis-arkhangelsk
pkgver=31
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://arkhangelsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Arkhangelsk-31.orig.zip")
md5sums=('ccaa3dcd08d717bca9780989f8ebfaca')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/arkhangelsk.dgdat" || return 1
  
}
