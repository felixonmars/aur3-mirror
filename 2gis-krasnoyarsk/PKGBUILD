pkgname=2gis-krasnoyarsk
pkgver=111
pkgrel=1
pkgdesc="Map of Krasnoyarsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/krasnoyarsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Krasnoyarsk-111.orig.zip")
md5sums=('2b8cec32538474c90c86b52a51223255')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnoyarsk.dgdat" "${pkgdir}/opt/2gis/2gis-krasnoyarsk.dgdat" || return 1
  
}
