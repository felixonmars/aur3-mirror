pkgname=2gis-sterlitamak
pkgver=26
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-26.orig.zip")
md5sums=('c358963cb5827af81356109e802a8ed8')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sterlitamak.dgdat" "${pkgdir}/opt/2gis/sterlitamak.dgdat" || return 1
  
}
