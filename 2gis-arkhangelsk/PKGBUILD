pkgname=2gis-arkhangelsk
pkgver=39
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/arkhangelsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Arkhangelsk-39.orig.zip")
md5sums=('4cc47b0de2d9bc9878f026df0bf44309')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/2gis-arkhangelsk.dgdat" || return 1
  
}
