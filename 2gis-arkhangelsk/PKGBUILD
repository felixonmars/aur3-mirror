pkgname=2gis-arkhangelsk
pkgver=37
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/arkhangelsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Arkhangelsk-37.orig.zip")
md5sums=('6b0eade2ed62c1396fd812d6604aeced')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/2gis-arkhangelsk.dgdat" || return 1
  
}
