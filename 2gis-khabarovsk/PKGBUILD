pkgname=2gis-khabarovsk
pkgver=46
pkgrel=1
pkgdesc="Map of Khabarovsk for 2GIS, September 2014"
arch=('i686' 'x86_64')
url="http://info.2gis.ru/khabarovsk/products/download#linux"
license=('custom')
depends=('2gis>=3.14.7.0')
source=("http://download.2gis.com/arhives/2GISData_Khabarovsk-46.orig.zip")
md5sums=('877b619eb2e89c5fa5a2c541f496d425')

package() {
  install -D -m 644 "${srcdir}/2gis/3.0/Data_Khabarovsk.dgdat" "${pkgdir}/opt/2gis/2gis-khabarovsk.dgdat" || return 1
  
}
