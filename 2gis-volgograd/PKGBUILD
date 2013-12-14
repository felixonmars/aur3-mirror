pkgname=2gis-volgograd
pkgver=39
pkgrel=1
pkgdesc="Map of Volgograd for 2GIS, December 2013"
arch=('i686' 'x86_64')
url="http://volgograd.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Volgograd-39.orig.zip")
md5sums=('d25bedce7cdad7ccd0c0997bee4114ac')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Volgograd.dgdat" "${pkgdir}/opt/2gis/volgograd.dgdat" || return 1
  
}
