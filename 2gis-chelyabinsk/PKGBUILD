pkgname=2gis-chelyabinsk
pkgver=81
pkgrel=1
pkgdesc="Map of Chelyabinsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://chelyabinsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Chelyabinsk-81.orig.zip")
md5sums=('42dea2b01f7dccc2d48d186e9b8b202f')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Chelyabinsk.dgdat" "${pkgdir}/opt/2gis/2gis-chelyabinsk.dgdat" || return 1
  
}
