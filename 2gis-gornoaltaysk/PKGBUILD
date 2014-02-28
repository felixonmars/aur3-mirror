pkgname=2gis-gornoaltaysk
pkgver=46
pkgrel=1
pkgdesc="Map of Gorny Altai for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://altai.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Gornoaltaysk-46.orig.zip")
md5sums=('1f43f3cd85706170b9b810e16106fc6e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Gornoaltaysk.dgdat" "${pkgdir}/opt/2gis/gornoaltaysk.dgdat" || return 1
  
}
