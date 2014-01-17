pkgname=2gis-belgorod
pkgver=31
pkgrel=1
pkgdesc="Map of Belgorod for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://belgorod.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Belgorod-31.orig.zip")
md5sums=('59a58096c111c81d5e13dbed4252f4a6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Belgorod.dgdat" "${pkgdir}/opt/2gis/belgorod.dgdat" || return 1
  
}
