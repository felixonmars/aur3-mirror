pkgname=2gis-sterlitamak
pkgver=24
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-24.orig.zip")
md5sums=('68a9fd22a7159d5cf83239004dd6f004')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sterlitamak.dgdat" "${pkgdir}/opt/2gis/sterlitamak.dgdat" || return 1
  
}
