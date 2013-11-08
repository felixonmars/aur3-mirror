pkgname=2gis-ulanude
pkgver=34
pkgrel=1
pkgdesc="Map of Ulan-Ude for 2GIS, November 2013"
arch=('i686' 'x86_64')
url="http://ulanude.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Ulanude-34.orig.zip")
md5sums=('d84f22f03c451ff7831608977a7c2f38')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Ulanude.dgdat" "${pkgdir}/opt/2gis/ulanude.dgdat" || return 1
  
}
