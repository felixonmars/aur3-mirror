pkgname=2gis-bratsk
pkgver=30
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-30.orig.zip")
md5sums=('4ffe6a3ea8ae4a8d70435a260d159f34')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bratsk.dgdat" "${pkgdir}/opt/2gis/bratsk.dgdat" || return 1
  
}
