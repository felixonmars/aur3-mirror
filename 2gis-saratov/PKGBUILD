pkgname=2gis-saratov
pkgver=33
pkgrel=1
pkgdesc="Map of Saratov for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://saratov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Saratov-33.orig.zip")
md5sums=('77ffa30cc337d731da9c400e4f3ae06a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Saratov.dgdat" "${pkgdir}/opt/2gis/saratov.dgdat" || return 1
  
}
