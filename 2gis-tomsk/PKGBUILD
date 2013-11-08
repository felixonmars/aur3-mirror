pkgname=2gis-tomsk
pkgver=107
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://tomsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tomsk-107.orig.zip")
md5sums=('175bf40f3d1256abff20c318e39da45b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tomsk.dgdat" "${pkgdir}/opt/2gis/tomsk.dgdat" || return 1
  
}
