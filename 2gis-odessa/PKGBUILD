pkgname=2gis-odessa
pkgver=91
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ua/odessa/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Odessa-91.orig.zip")
md5sums=('2e92e0b5282d40fa437f9b5934132ad7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/2gis-odessa.dgdat" || return 1
  
}
