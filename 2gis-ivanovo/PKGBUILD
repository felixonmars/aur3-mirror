pkgname=2gis-ivanovo
pkgver=31
pkgrel=1
pkgdesc="Map of Ivanovo for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/ivanovo/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Ivanovo-31.orig.zip")
md5sums=('76a794a9a580439f3b16c34dc7f61e3a')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ivanovo.dgdat" "${pkgdir}/opt/2gis/2gis-ivanovo.dgdat" || return 1
  
}
