pkgname=2gis-vladivostok
pkgver=49
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, April 2014"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-49.orig.zip")
md5sums=('f27e93e6b97c9055e1b30423b7914baa')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/2gis-vladivostok.dgdat" || return 1
  
}
