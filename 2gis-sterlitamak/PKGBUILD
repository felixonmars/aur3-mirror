pkgname=2gis-sterlitamak
pkgver=29
pkgrel=1
pkgdesc="Map of Sterlitamak for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://sterlitamak.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Sterlitamak-29.orig.zip")
md5sums=('c38e2d7f0ede6a6576a6a55f7fe2bbfd')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Sterlitamak.dgdat" "${pkgdir}/opt/2gis/2gis-sterlitamak.dgdat" || return 1
  
}
