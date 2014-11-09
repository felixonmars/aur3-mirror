pkgname=2gis-yakutsk
pkgver=39
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/yakutsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Yakutsk-39.orig.zip")
md5sums=('d68ef435a90399ea0a41ecc294cdaf6d')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/2gis-yakutsk.dgdat" || return 1
  
}
