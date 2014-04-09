pkgname=2gis-irkutsk
pkgver=96
pkgrel=1
pkgdesc="Map of Irkutsk for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://irkutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Irkutsk-96.orig.zip")
md5sums=('3e1058c46462a83db7f13fdf7a1ed827')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Irkutsk.dgdat" "${pkgdir}/opt/2gis/2gis-irkutsk.dgdat" || return 1
  
}
