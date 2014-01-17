pkgname=2gis-tyumen
pkgver=86
pkgrel=1
pkgdesc="Map of Tyumen for 2GIS, January 2014"
arch=('i686' 'x86_64')
url="http://tyumen.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Tyumen-86.orig.zip")
md5sums=('3a079b0f85942689899722451a8ce5f1')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Tyumen.dgdat" "${pkgdir}/opt/2gis/tyumen.dgdat" || return 1
  
}
