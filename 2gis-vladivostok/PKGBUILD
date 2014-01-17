pkgname=2gis-vladivostok
pkgver=46
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-46.orig.zip")
md5sums=('bf7053700c46a3b4361423f76488ee06')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/vladivostok.dgdat" || return 1
  
}
