pkgname=2gis-khabarovsk
pkgver=48
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, November 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/khabarovsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.9.0')
source=("http://download.2gis.com/arhives/2GISData_Khabarovsk-48.orig.zip")
md5sums=('f1a44014e266108831a361c05ce716be')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/2gis-khabarovsk.dgdat" || return 1
  
}
