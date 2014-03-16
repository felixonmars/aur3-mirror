pkgname=2gis-volgograd
pkgver=42
pkgrel=1
pkgdesc="Map of Volgograd for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://volgograd.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Volgograd-42.orig.zip")
md5sums=('1c382baf523c0468c0f195e349b8e752')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Volgograd.dgdat" "${pkgdir}/opt/2gis/volgograd.dgdat" || return 1
  
}
