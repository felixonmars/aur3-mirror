pkgname=2gis-kurgan
pkgver=101
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, August 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kurgan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Kurgan-101.orig.zip")
md5sums=('03c10e9c6cb2c1cc80d59e302ac2ec3f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/2gis-kurgan.dgdat" || return 1
  
}
