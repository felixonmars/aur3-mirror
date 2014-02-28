pkgname=2gis-vladivostok
pkgver=47
pkgrel=1
pkgdesc="Map of Vladivostok for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://vladivostok.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Vladivostok-47.orig.zip")
md5sums=('1d3544ba551899b412c23d796605c33e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Vladivostok.dgdat" "${pkgdir}/opt/2gis/vladivostok.dgdat" || return 1
  
}
