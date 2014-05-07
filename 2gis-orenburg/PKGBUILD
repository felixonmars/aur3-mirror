pkgname=2gis-orenburg
pkgver=34
pkgrel=1
pkgdesc="Map of Orenburg for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://orenburg.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Orenburg-34.orig.zip")
md5sums=('e14076d18816b9c61cd64a55f56b1050')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Orenburg.dgdat" "${pkgdir}/opt/2gis/2gis-orenburg.dgdat" || return 1
  
}
