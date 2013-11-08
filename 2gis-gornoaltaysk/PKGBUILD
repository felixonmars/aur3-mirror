pkgname=2gis-gornoaltaysk
pkgver=43
pkgrel=1
pkgdesc="Map of Gorny Altai for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://altai.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Gornoaltaysk-43.orig.zip")
md5sums=('8bf23fadcc6bb980b688bce629563056')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Gornoaltaysk.dgdat" "${pkgdir}/opt/2gis/gornoaltaysk.dgdat" || return 1
  
}
