pkgname=2gis-samara
pkgver=67
pkgrel=1
pkgdesc="Map of Samara for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://samara.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Samara-67.orig.zip")
md5sums=('8286a64cf923664ab96d50f1ea241cd2')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Samara.dgdat" "${pkgdir}/opt/2gis/samara.dgdat" || return 1
  
}
