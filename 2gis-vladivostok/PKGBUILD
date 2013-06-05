pkgname=2gis-vladivostok
pkgver=39
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, June 2013"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.5.1')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-39.orig.zip")
md5sums=('d0f7305ceeef1c06c4f927cd0bf97cef')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/vladivostok.dgdat" || return 1
  install -D -m 644 "${srcdir}/2gis/3.0/Plugins/DGisLan/Vladivostok.dglf" "${pkgdir}/opt/2gis/Plugins/DGisLan/vladivostok.dglf" || return 1
}
