pkgname=2gis-odessa
pkgver=93
pkgrel=1
pkgdesc="Map of Odessa for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ua/odessa/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Odessa-93.orig.zip")
md5sums=('e72e2fc8d03607042cfe371e8a70c883')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Odessa.dgdat" "${pkgdir}/opt/2gis/2gis-odessa.dgdat" || return 1
  
}
