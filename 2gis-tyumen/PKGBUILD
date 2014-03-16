pkgname=2gis-tyumen
pkgver=88
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, March 2014"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-88.orig.zip")
md5sums=('deb2ab5b3a336aae90a8f6dc0dae819b')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/tyumen.dgdat" || return 1
  
}
