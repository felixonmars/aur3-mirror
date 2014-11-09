pkgname=2gis-gornoaltaysk
pkgver=55
pkgrel=1
pkgdesc="Map of Gorny Altai for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/gornyi-altai/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Gornoaltaysk-55.orig.zip")
md5sums=('b2919682ae2bbfda734f673cbf99bf81')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Gornoaltaysk.dgdat" "${pkgdir}/opt/2gis/2gis-gornoaltaysk.dgdat" || return 1
  
}
