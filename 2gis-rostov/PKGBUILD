pkgname=2gis-rostov
pkgver=47
pkgrel=1
pkgdesc="Map of Rostov-na-Donu for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://rostov.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Rostov-47.orig.zip")
md5sums=('b80c4d0b188799f1f1d7bdc13775f8c0')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Rostov.dgdat" "${pkgdir}/opt/2gis/rostov.dgdat" || return 1
  
}
