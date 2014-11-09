pkgname=2gis-kazan
pkgver=72
pkgrel=1
pkgdesc="Map of Kazan for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/kazan/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Kazan-72.orig.zip")
md5sums=('672ec389e3255c3c7d180b50d7410f3b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Kazan.dgdat" "${pkgdir}/opt/2gis/2gis-kazan.dgdat" || return 1
  
}
