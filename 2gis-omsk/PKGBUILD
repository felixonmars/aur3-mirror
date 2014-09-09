pkgname=2gis-omsk
pkgver=121
pkgrel=1
pkgdesc="Map of Omsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/omsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Omsk-121.orig.zip")
md5sums=('34dc6b7200a7a59af6afa08a99a046d6')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Omsk.dgdat" "${pkgdir}/opt/2gis/2gis-omsk.dgdat" || return 1
  
}
