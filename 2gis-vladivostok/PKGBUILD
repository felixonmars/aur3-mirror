pkgname=2gis-vladivostok
pkgver=42
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, September 2013"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-42.orig.zip")
md5sums=('ce6aad9a40d8c1dc7521aee92e762748')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/vladivostok.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Vladivostok.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/vladivostok.dglf" || return 1
}
