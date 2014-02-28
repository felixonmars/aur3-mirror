pkgname=2gis-togliatti
pkgver=67
pkgrel=1
pkgdesc="Map of Togliatti for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://tlt.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Togliatti-67.orig.zip")
md5sums=('ad5d0fde798e271d8ee1dc8c8010f533')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Togliatti.dgdat" "${pkgdir}/opt/2gis/togliatti.dgdat" || return 1
  
}
