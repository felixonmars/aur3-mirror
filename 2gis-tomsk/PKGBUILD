pkgname=2gis-tomsk
pkgver=111
pkgrel=1
pkgdesc="Map of Tomsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://tomsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tomsk-111.orig.zip")
md5sums=('e6237e575438a8235149a97935b316a5')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tomsk.dgdat" "${pkgdir}/opt/2gis/tomsk.dgdat" || return 1
  
}
