pkgname=2gis-smolensk
pkgver=21
pkgrel=1
pkgdesc="Map of Smolensk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://smolensk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Smolensk-21.orig.zip")
md5sums=('be6add382b91bfdaff6d3d35bf3dc714')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Smolensk.dgdat" "${pkgdir}/opt/2gis/smolensk.dgdat" || return 1
  
}
