pkgname=2gis-khabarovsk
pkgver=42
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, May 2014"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.14.4.0')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-42.orig.zip")
md5sums=('311f85986714ff86cc60dfa930958161')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/2gis-khabarovsk.dgdat" || return 1
  
}
