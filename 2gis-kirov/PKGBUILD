pkgname=2gis-kirov
pkgver=31
pkgrel=1
pkgdesc="Map of Kirov for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kirov/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kirov-31.orig.zip")
md5sums=('8ee174c215fe316ed9bd6ccf9a7437bb')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kirov.dgdat" "${pkgdir}/opt/2gis/2gis-kirov.dgdat" || return 1
  
}
