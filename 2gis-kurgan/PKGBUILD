pkgname=2gis-kurgan
pkgver=104
pkgrel=1
pkgdesc="Map of Kurgan for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kurgan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Kurgan-104.orig.zip")
md5sums=('008ac88930deb4dca8e89542f07aff8e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kurgan.dgdat" "${pkgdir}/opt/2gis/2gis-kurgan.dgdat" || return 1
  
}
