pkgname=2gis-khabarovsk
pkgver=39
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, February 2014"
arch=('i686' 'x86_64')
url="http://khabarovsk.2gis.ru/how-get/linux/"
license=('custom')
depends=('2gis>=3.13.11.0')
source=("http://download.2gis.ru/arhives/2GISData_Khabarovsk-39.orig.zip")
md5sums=('73609bc42e444237f16640957aaaa76e')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/khabarovsk.dgdat" || return 1
  
}
