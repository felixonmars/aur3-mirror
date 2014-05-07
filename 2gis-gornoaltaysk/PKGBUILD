pkgname=2gis-gornoaltaysk
pkgver=49
pkgrel=1
pkgdesc="Map of Gorny Altai for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://gornyi-altai.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Gornoaltaysk-49.orig.zip")
md5sums=('6d3fe0d9ca0cef185dda41a70da0f61c')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Gornoaltaysk.dgdat" "${pkgdir}/opt/2gis/2gis-gornoaltaysk.dgdat" || return 1
  
}
