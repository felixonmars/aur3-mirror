pkgname=2gis-bratsk
pkgver=32
pkgrel=1
pkgdesc="Map of Bratsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://bratsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Bratsk-32.orig.zip")
md5sums=('6fe2162aa95b8036c79d41b37c864e83')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Bratsk.dgdat" "${pkgdir}/opt/2gis/2gis-bratsk.dgdat" || return 1
  
}
