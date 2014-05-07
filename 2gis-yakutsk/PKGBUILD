pkgname=2gis-yakutsk
pkgver=33
pkgrel=1
pkgdesc="Map of Yakutsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://yakutsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Yakutsk-33.orig.zip")
md5sums=('48e6fd5f59bbe005bab4099b6abac7ab')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Yakutsk.dgdat" "${pkgdir}/opt/2gis/2gis-yakutsk.dgdat" || return 1
  
}
