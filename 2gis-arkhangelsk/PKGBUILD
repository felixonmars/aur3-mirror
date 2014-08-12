pkgname=2gis-arkhangelsk
pkgver=36
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/arkhangelsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Arkhangelsk-36.orig.zip")
md5sums=('e737c3b3ab72fd9e7bad465b49a9544f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/2gis-arkhangelsk.dgdat" || return 1
  
}
