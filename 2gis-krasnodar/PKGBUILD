pkgname=2gis-krasnodar
pkgver=51
pkgrel=1
pkgdesc="Map of Krasnodar for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://krasnodar.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Krasnodar-51.orig.zip")
md5sums=('7589f56b9d70996e5fcc655f27cc1610')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Krasnodar.dgdat" "${pkgdir}/opt/2gis/2gis-krasnodar.dgdat" || return 1
  
}
