pkgname=2gis-kurgan
pkgver=102
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kurgan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kurgan-102.orig.zip")
md5sums=('bc8217ca39e2543f63c57387c22e60b6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/2gis-kurgan.dgdat" || return 1
  
}
