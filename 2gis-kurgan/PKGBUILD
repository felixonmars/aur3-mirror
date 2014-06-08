pkgname=2gis-kurgan
pkgver=99
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, June 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kurgan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.6.0')
source=("http://download.2gis.com/arhives/2GISData_Kurgan-99.orig.zip")
md5sums=('1ebe4d491f70e15a74850ee9d77c15ef')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/2gis-kurgan.dgdat" || return 1
  
}
