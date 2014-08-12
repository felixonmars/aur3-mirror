pkgname=2gis-stavropol
pkgver=32
pkgrel=1
pkgdesc="Map of Stavropol for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/stavropol/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Stavropol-32.orig.zip")
md5sums=('aeb2fbc29f9f331c16c2ef98f354e678')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Stavropol.dgdat" "${pkgdir}/opt/2gis/2gis-stavropol.dgdat" || return 1
  
}
