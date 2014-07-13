pkgname=2gis-vladivostok
pkgver=52
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, July 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/vladivostok/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Vladivostok-52.orig.zip")
md5sums=('2bef4427036caae328cd5cdfd2f62ad1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/2gis-vladivostok.dgdat" || return 1
  
}
