pkgname=2gis-tomsk
pkgver=110
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://tomsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tomsk-110.orig.zip")
md5sums=('4bc3bac5e709be406f9b1ab5b6195b49')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tomsk.dgdat" "${pkgdir}/opt/2gis/tomsk.dgdat" || return 1
  
}
