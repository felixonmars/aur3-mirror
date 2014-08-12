pkgname=2gis-gornoaltaysk
pkgver=52
pkgrel=1
pkgdesc="Map of Gorny Altai for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/gornyi-altai/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Gornoaltaysk-52.orig.zip")
md5sums=('f7f7db49bf8a1bd0e6dec0b6042cd3e7')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Gornoaltaysk.dgdat" "${pkgdir}/opt/2gis/2gis-gornoaltaysk.dgdat" || return 1
  
}
