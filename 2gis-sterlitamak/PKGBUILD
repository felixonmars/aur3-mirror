pkgname=2gis-sterlitamak
pkgver=30
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-30.orig.zip")
md5sums=('fde3e60bb040bb88a96a682b99f655a4')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sterlitamak.dgdat" "${pkgdir}/opt/2gis/2gis-sterlitamak.dgdat" || return 1
  
}
