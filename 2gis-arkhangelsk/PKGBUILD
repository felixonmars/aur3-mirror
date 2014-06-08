pkgname=2gis-arkhangelsk
pkgver=34
pkgrel=1
pkgdesc="Map of Arkhangelsk for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/arkhangelsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Arkhangelsk-34.orig.zip")
md5sums=('70659a255902598feb378e8f8228c2cf')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Arkhangelsk.dgdat" "${pkgdir}/opt/2gis/2gis-arkhangelsk.dgdat" || return 1
  
}
