pkgname=2gis-odessa
pkgver=81
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://odessa.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Odessa-81.orig.zip")
md5sums=('9ed3fa289872c67804dc72ff910a02eb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/odessa.dgdat" || return 1
  
}
